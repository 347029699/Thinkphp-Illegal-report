<?php

namespace app\index\controller;

use app\common\controller\Common;
use app\user\model\User;
use think\Session;
use app\common\model\Wechat as WechatModel;
use app\index\model\Common as CommonModel;

/**
 * 前台公共控制器
 * @package app\index\controller
 */
class Home extends Common
{

    /**
     * 用户ID
     * @var int
     */
    protected $uid;

    /**
     * 用户对象
     * @var User
     */
    protected $user;

    /**
     * 当前控制器是否需要在微信浏览器中
     * @var bool
     */
    protected $wechat = false;

    /**
     * 当前控制器是否需要登陆
     * @var bool
     */
    protected $login = true;

    /**
     * 需要排除的操作
     * @var array
     */
    protected $except = [
        'wechat' => ['wechat'],
        'login'  => ['wechat'],
    ];


    /**
     * 初始化方法
     */
    protected function initialize()
    {

        // 系统开关
        if (!config('web_site_status')) {
            $this->error('站点已经关闭，请稍后访问~');
        }

        $this->except = [
            'wechat' => isset($this->except['wechat']) ? $this->except['wechat'] : [],
            'login'  => isset($this->except['login']) ? $this->except['login'] : [],
        ];

        $wechatUser = session('wechatUser');
        if ($this->wechat && !in_array($this->request->action(), $this->except['wechat'])) {
            if (empty($wechatUser)) {
                $app = WechatModel::app();
                $oauth = $app->oauth;
                session('target_url',$this->request->url());
                $oauth->redirect($this->request->domain()."/index/index/wechat")->send();
            }

            $this->uid = is_signin();
            if ($this->uid) {
                $this->user = session('user_auth');
            } else {
                if ($this->login && !in_array($this->request->action(), $this->except['login'])) {
                    $UserModel = new User();
                    $user = '';
                    if($wechatUser['openid']){
                        $user = $UserModel::get(['openid' => $wechatUser['openid']]);
                    }
                    if ($user) {
                        //已注册用户自动登陆
                        $user->save(['avatar' => $wechatUser['avatar']]);
                        $UserModel->autoLogin($user,'',1);
                        $this->uid  = $user->id;
                        $this->user = $user;
                    } else {
                        //未注册用户跳转到绑定页面
//                        session('forward', $this->request->url());
//                        $this->redirect('/index/user/bind');
                        $data = [
                            'username'=>"YZ",
                            'nickname'=>$wechatUser['nickname'],
                            'avatar'=>$wechatUser['avatar'],
                            'openid'=>$wechatUser['openid'],
                            'status'=>1,
                            'group'=>0,
                            'role'=>0,
                            'password'=>'123123',
                            'last_login_time'=>time(),
                        ];
                        $user = $UserModel->create($data);
                        $UserModel->where(['id'=>$user['id']])->update(['username'=>"YZ".CommonModel::leftReal($user['id'])]);
                        $this->uid  = $user['id'];
                        $this->user = $user;
                        $UserModel->autoLogin($user,'',1);
                    }
                }
            }
        }
    }

    /**
     * 微信用户网页授权后回调
     */
    public function wechat(){
        $oauth = WechatModel::app()->oauth;
        try {
            $wechatUser = $oauth->user()->getOriginal();
            session('wechatUser', [
                'nickname' => $wechatUser['nickname'],
                'avatar'   => $wechatUser['headimgurl'],
                'openid'   => $wechatUser['openid'],
            ]);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->redirect(session('target_url'));
        //$this->redirect(url('/index/index/index'));
    }

}

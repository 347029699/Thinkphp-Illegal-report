<?php

namespace app\common\service;

use think\Cache;
use think\Config;
use think\Validate;
use think\Session;
use app\user\model\User;
use think\facade\Env;

class Sms
{
    /**
     * @var string $account 短信api账号
     */
    protected $account;
    /**
     * @var string $account 短信api密码
     */
    protected $password;
    /**
     * @var string $mobile 需要发送的手机号码
     */
    protected $mobile;
    /**
     * @var int $scene 验证场景
     */
    protected $scene = 0;
    /**
     * @var string $error 错误信息
     */
    protected $error;

    public function __construct()
    {
//        $config         = Config::get('sms');
        $this->account  = Env::get('sms_account');
        $this->password = Env::get('sms_password');
    }

    /**
     * 设置手机号码
     * @param string $mobile
     * @return $this
     */
    public function mobile($mobile)
    {
        $this->mobile = $mobile;
        return $this;
    }

    /**
     * 设置验证场景
     * @param int $scene 0手机号码必须不存在 1手机号码必须存在
     * @return $this
     */
    public function scene($scene)
    {
        $this->scene = $scene;
        return $this;
    }

    /**
     * 验证手机号码
     * @return bool
     */
    protected function validate()
    {
        $validate = new Validate([
            'mobile|手机号码' => 'require|regex:^1\d{10}',
        ], [
            'mobile.regex' => ':attribute格式错误',
        ]);
        if (true !== $validate->check(['mobile' => $this->mobile])) {
            $this->error = $validate->getError();
            return false;
        }
        $user = User::get(['mobile' => $this->mobile]);
        if ($user && !$this->scene) {
            $this->error = '该手机号码已被注册';
            return false;
        }
//        if (!$user && $this->scene) {
//            $this->error = '该手机号码未注册';
//            return false;
//        }
//        if (Cache::has('smscode_' . $this->mobile)) {
//            $this->error = '请稍后再试';
//            return false;
//        }
        return true;
    }

    /**
     * 发送短信验证码
     * @return bool
     */
    public function send($model=0)
    {
        if (false === $this->validate() && $model == 0) {
            return false;
        }
        $code = rand(10000, 99999);
        $url  = "http://sms.106jiekou.com/utf8/sms.aspx";
        $data = "account=$this->account&password=$this->password&mobile=$this->mobile&content="
            . rawurlencode("您的验证码是：" . $code . "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！");

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_NOBODY, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        $result = curl_exec($curl);
        curl_close($curl);


        if ($result == '100') {
            cookie('smscode_' . $this->mobile, 1, 60);
            session('smscode', [
                'code' => $code,
                'time' => time(),
            ]);
            return true;
        } else {

            //写入日志计入下错误原因

            $this->error = '发送失败';
            return false;
        }
    }

    /**
     * 验证短信验证码
     * @param int $code 验证码
     * @return bool
     */
    public function check($code)
    {

        $key     = 'smscode';
        $smscode = session($key);

        if (empty($code) || empty($smscode)) {
            $this->error = '短信验证码不存在';
            return false;
        }
        if (time() - $smscode['time'] > 300) {
            unset($_SESSION[$key]);
            $this->error = '短信验证码已过期';
            return false;
        }
        if ($code == $smscode['code']) {
            unset($_SESSION[$key]);
            return true;
        }
        $this->error = '短信验证码错误';
        return false;
    }

    /**
     * 获取错误信息
     */
    public function getError()
    {
        return $this->error;
    }
}




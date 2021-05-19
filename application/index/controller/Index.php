<?php

namespace app\index\controller;
use think\Session;
use util\Tree;
use think\Db;
use think\facade\Env;
use app\common\controller\Common;

/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Common
{

    public function index()
    {
    	$this->redirect('report/index/login');
    }

}

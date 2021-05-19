<?php

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('hello/:name', 'index/hello');
//Route::get('wechat', 'index/index/wechat');

//Route::domain('hdnew','index');
//Route::domain('*.activity','activity');

//return [
//    '__domain__'=>[
////        '*.blog'      => [
////            // 动态注册域名的路由规则
////            ':id' => ['blog/read',['method'=>'GET'],['id'=>'\d+']],
////            ':name'=>'blog/read',
////        ],
//        // 泛域名规则建议在最后定义
//        'admin'         =>'/',
//        'hdnew'         =>'/index',
////        'admin'         =>'admin',
//        '*'         => 'index/activity',
//    ],
//
//
//];

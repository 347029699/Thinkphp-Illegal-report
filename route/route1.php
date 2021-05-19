<?php

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('hello/:name', 'index/hello');
Route::get('wechat', 'index/Home/wechat');
return [
    '__domain__'=>[
        '*.blog'      => [
            // 动态注册域名的路由规则
            ':id' => ['blog/read',['method'=>'GET'],['id'=>'\d+']],
            ':name'=>'blog/read',
        ],
        // 泛域名规则建议在最后定义
        '*.user'    =>  'user',
        'www'         => 'index',
        '*.activity'         => 'index/activity',
    ],
];

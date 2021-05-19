<?php

/**
 * 模块信息
 */
return [
    // 模块名[必填]
    'name'        => 'report',
    // 模块标题[必填]
    'title'       => '采矿举报',
    // 模块唯一标识[必填]，格式：模块名.开发者标识.module
    'identifier'  => 'report.demon.module',
    // 模块描述[必填]
    'description' => '举报模块',
    // 开发者[必填]
    'author'      => 'demon',
    // 开发者网址[选填]
    'author_url'  => '',
    // 版本[必填],格式采用三段式：主版本号.次版本号.修订版本号
    'version'     => '1.0.0',
    // 模块依赖[可选]，格式[[模块名, 模块唯一标识, 依赖版本, 对比方式]]
    'need_module' => [
        ['admin', 'admin.ma.module', '1.0.0']
    ],
    // 插件依赖[可选]，格式[[插件名, 插件唯一标识, 依赖版本, 对比方式]]
    'need_plugin' => [],
    // 数据表[有数据库表时必填]
];

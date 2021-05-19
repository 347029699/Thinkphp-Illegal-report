<?php

namespace app\user\validate;

use think\Validate;

/**
 * 栏目验证器
 * @package app\cms\validate
 */
class Structure extends Validate
{
    // 定义验证规则
    protected $rule = [
        'pid|所属栏目'    => 'require',
        'name|栏目名称'   => 'require|unique:cms_column,name^pid',
    ];
}

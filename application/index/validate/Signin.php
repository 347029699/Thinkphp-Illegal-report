<?php

namespace app\index\validate;

use think\Validate;

class Signin extends Validate
{
    protected $rule = [
        'date'  => 'unique:signin,date^uid',
    ];

    protected $message = [
        'date'  => '今天已签到',
    ];
}
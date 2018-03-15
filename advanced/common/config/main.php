<?php
return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user'=>[
            'identityClass'=>'frontend\models\users',
            'enableAutoLogin'=>true,
            'idParam'=>'userid',
            'loginUrl'=>'Index/login'
        ],
    ],
];

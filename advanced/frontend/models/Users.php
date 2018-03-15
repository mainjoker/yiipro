<?php

namespace frontend\models;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

use Yii;

/**
 * This is the model class for table "{{%users}}".
 *
 * @property string $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property integer $createtime
 * @property string $loginip
 * @property string $islock
 */
class Users extends \yii\db\ActiveRecord implements IdentityInterface
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%users}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['createtime', 'loginip'], 'integer'],
            [['islock'], 'string'],
            ['username','required','message'=>'用户名不能为空','on'=>['login','register']],
            ['password','required','message'=>'密码不能为空','on'=>['login','register']],
            [['username', 'password', 'email'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'password' => 'Password',
            'email' => 'Email',
            'createtime' => 'Createtime',
            'loginip' => 'Loginip',
            'islock' => 'Islock',
        ];
    }

    public static function findIdentity($id)
    {
        return static::findOne(['id'=>$id]);
    }
    public  static function findIdentityByAccessToken($token, $type = NULL){
        return null;
    }
    public  function getId(){
        return $this->id;
    }
    public  function getAuthKey(){
         return '';
          //return $this->authKey;
    }
    public  function validateAuthKey($authKey)
    {
        return true;
        //return $this->authKey === $authKey;
    }
    public function login($data)
    {
        $this->scenria='login';
        if ($this->load($data) && $this->validate()) {
            
        }

    }
    public function getUser()
    {
        $loginName=$this->username?$this->username:$this->email;
        return $this->find()->where("username=:loginname or email=:loginname",[':loginname'=>$loginName])->one();
    }


}

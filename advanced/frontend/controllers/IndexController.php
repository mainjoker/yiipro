<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use frontend\models\Users;

/**
 * Site controller
 */
class IndexController extends Controller
{
    /**
     * @inheritdoc
     */
  /*  public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }
*/
    public function actionTest(){
    	echo 'index/test';
    }
    public function actionLogin(){

        // $model=new LoginForm;
        $model=new Users;
        if (yii::$app->request->isPost()) {
            $data=yii::$app->request->post();
            if ($model->login($data)) {
                //登录成功
                echo 'login success!!!';
            }
          
        }
        //return  $this->render('login',['model'=>$model]);
        return $this->render('login', [
                'model' => $model,
            ]);

    }


}

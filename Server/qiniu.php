<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/7/15
 * Time: 7:23 PM
 */
require_once 'vendor/autoload.php';
use Qiniu\Auth;


class Qiniu {
    public static function getUploadToken(){
        $accessKey = 'MV6ja7j7Z6lSJJGCs7ycWsc0-sHluayNZOcL9Yun';
        $secretKey = '-m_KorldbIhQrzGeLDOAjwP1fb8ZJZ-aBDRuEoWl';
        $auth = new Auth($accessKey, $secretKey);

        $bucket = 'chichichi';

        $token = $auth->uploadToken($bucket);

        return $token;
    }
}
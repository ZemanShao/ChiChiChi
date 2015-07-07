<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/7/15
 * Time: 7:29 PM
 */
header("Content-Type:text/json; charset=utf8");
include_once('qiniu.php');

$token = Qiniu::getUploadToken();

echo '{"token":"'.$token.'"}';
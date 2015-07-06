<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/6/15
 * Time: 4:40 PM
 */

header("Content-Type:text/json; charset=utf8");
include_once('ShopDao.php');

$shopId = $_GET['shopId'];

$shopDao = ShopDao::sharedShopDao();
$result = $shopDao->getShop($shopId);
$shop = $result->toJson();


echo '{"shops:'.$shop.'"}';
?>
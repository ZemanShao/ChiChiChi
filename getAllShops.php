<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/6/15
 * Time: 2:31 PM
 */
header("Content-Type:text/json; charset=utf8");
include_once('ShopDao.php');

$shopDap = ShopDao::sharedShopDao();
$result = $shopDap->getAllShops();
$shops = ShopBean::arrayToJson($result,false);

echo '{"shops:'.$shops.'"}';
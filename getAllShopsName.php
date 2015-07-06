<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/6/15
 * Time: 4:20 PM
 */

header("Content-Type:text/json; charset=utf8");
include_once('ShopDao.php');

$shopDap = ShopDao::sharedShopDao();
$result = $shopDap->getAllShops();
$shops = ShopBean::arrayToJson($result,true);

echo '{"shops:'.$shops.'"}';
<?php
header("Content-Type:text/json; charset=utf8");

include_once('shopbean.php');
include_once('shopdao.php');

$shopDao = ShopDao::sharedShopDao();
$result = $shopDao->getAllShops();
$shops = ShopBean::arrayToJson($result,false);

echo '{"shops":'.$shops.'}';

?>

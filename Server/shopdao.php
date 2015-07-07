<?php
ini_set('memory_limit', '56M');
include_once('database.php');
include_once('shopbean.php');

class ShopDao {
    private static $_sharedShopDao = null;

    function __construct() {

    }

    public static function sharedShopDao(){
        if(self::$_sharedShopDao == null){
            self::$_sharedShopDao = new ShopDao();
        }
        return self::$_sharedShopDao;
    }

    public function setShopWithRow($row){
        $shop = new ShopBean();
        $shop->setShopId($row['id']);
        $shop->setShopName($row['name']);
        $shop->setShopTel($row['tel']);
        $shop->setShopImage($row['image']);
        return $shop;
    }

    public function getAllShops(){
        $database = Database::sharedDatabase();
        $database->connectDatabase();
        $sql = "SELECT * FROM Shop";
        $result = mysql_query($sql);
        $database->closeDatabase();


        $shops = array();
        while($row = mysql_fetch_array($result)){
            $shop = $this->setShopWithRow($row);
            array_push($shops,$shop);
        }
        return $shops;
    }

    public function getShop($shopId){
        $database = Database::sharedDatabase();
        $database->connectDatabase();
        $sql = "SELECT * FROM Shop WHERE id=$shopId";
        $result = mysql_query($sql);
        $database->closeDatabase();
        $row = mysql_fetch_array($result);

        return $this->setShopWithRow($row);
    }

}

?>
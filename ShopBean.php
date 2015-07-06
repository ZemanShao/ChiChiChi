<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/6/15
 * Time: 1:54 PM
 */

class ShopBean {
    private $shopId;
    private $shopName;
    private $shopTel;
    private $shopImage;
    /**
     * @return mixed
     */
    public function getShopId()
    {
        return $this->shopId;
    }

    /**
     * @param mixed $shopId
     */
    public function setShopId($shopId)
    {
        $this->shopId = $shopId;
    }

    /**
     * @return mixed
     */
    public function getShopTel()
    {
        return $this->shopTel;
    }

    /**
     * @param mixed $shopTel
     */
    public function setShopTel($shopTel)
    {
        $this->shopTel = $shopTel;
    }

    /**
     * @return mixed
     */
    public function getShopName()
    {
        return $this->shopName;
    }

    /**
     * @param mixed $shopName
     */
    public function setShopName($shopName)
    {
        $this->shopName = $shopName;
    }

    /**
     * @return mixed
     */
    public function getShopImage()
    {
        return $this->shopImage;
    }

    /**
     * @param mixed $shopImage
     */
    public function setShopImage($shopImage)
    {
        $this->shopImage = $shopImage;
    }



    public function toJson(){
        return urldecode(json_encode((array("shopId"=>$this->shopId,
                                            "shopName"=>$this->shopName,
                                            "shopTel"=>$this->shopTel,
                                            "shopImage"=>$this->shopImage))));
    }

    public function toJsonWithName(){
        return urldecode(json_encode((array("shopId"=>$this->shopId,
                                            "shopName"=>$this->shopName))));
    }

    public static function arrayToJson($shops,$isNameOnly){
        $result = '[';
        $arrayCount = count($shops);
        for($i = 0 ; $i < $arrayCount; $i++){
            $shop = $shops[$i];
            if($isNameOnly){
                $result = $result.$shop->toJsonWithName();
            }
            else{
                $result = $result.$shop->toJson();
            }
            if($i<$arrayCount-1){
                $result = $result.',';
            }
        }
        $result = $result.']';
        return $result;
    }
}
?>
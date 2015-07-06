<?php
/**
 * Created by PhpStorm.
 * User: nathan
 * Date: 7/6/15
 * Time: 1:46 PM
 */

class Database{

    private static $_sharedDatabase = null;

    private $hostName = "127.0.0.1";
    private $account = "root";
    private $password = "password";
    private $databaseName = "ChiChiChi";
    private $con = null;
    private $isConnect = false;


    public static function sharedDatabase(){
        if(self::$_sharedDatabase == null){
            self::$_sharedDatabase = new Database();
        }
        return self::$_sharedDatabase;
    }

    public function connectDatabase()
    {
        if ($this->isConnect == true) return ;
        $this->isConnect=true;

        $this->con = mysql_connect ($this->hostName, $this->account, $this->password );
        if (! $this->con) {
            die ( 'Could not connect: ' . mysql_error () );
        }
        mysql_select_db ($this->getDatabaseName(), $this->getCon() );
        mysql_query("SET NAMES UTF8");
    }

    public function closeDatabase()
    {
        if ($this->isConnect==false) return ;
        mysql_close ( $this->con );
        $this->con=null;
        $this->isConnect=false;
    }

    public function getCon()
    {
        if ($this->isConnect==false)
        {
            $this->connectDatabase();
        }
        return $this->con;
    }

    public function getDatabaseName()
    {
        return $this->databaseName;
    }

}
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DataBaseConnection
 *
 * @author lorenzo
 */
class DataBaseConnection {
    
    private static $DataBaseConnectionInstance;
    private $connection;
    
    private function __construct(){
        $this->connection();
    }
    
    public static function getDBConnectionInstance(){
        if(self::$DataBaseConnectionInstance == null){   
            $class = __CLASS__;
            self::$DataBaseConnectionInstance = new $class;
        }
        return self::$DataBaseConnectionInstance;
    }
    
    public function connection(){
        $this->connection = mysql_connect('localhost', 'root', 'asus');
        if (!$this->connection) {
            die('Could not connect: ' . mysql_error());
        }
        //echo 'Connected successfully<br/>'; 
        mysql_select_db("mytraining") or die(mysql_error()) or die(mysql_error());
    }
    
    
}

?>

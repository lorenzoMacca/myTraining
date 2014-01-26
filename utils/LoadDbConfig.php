<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LoadDbConfig
 *
 * @author lorix
 */
class LoadDbConfig {

    //put your code here
    private $system;
    private $user;
    private $password;
    private $dbName;
    private static $fileName = './config/dbConfig.db';

    public function __construct() {
        $config = file_get_contents(LoadDbConfig::$fileName);
        //echo $config;
        list($this->system, $this->user, $this->password, $this->dbName) = explode('??', $config);
    }

    public function getSystem() {
        return $this->system;
    }

    public function getUser() {
        return $this->user;
    }

    public function getPassword() {
        return $this->password;
    }

    public function setSystem($system) {
        $this->system = $system;
    }

    public function setUser($user) {
        $this->user = $user;
    }

    public function setPassword($password) {
        $this->password = $password;
    }

    public function getDbName() {
        return $this->dbName;
    }

    public static function getFileName() {
        return self::$fileName;
    }

    public function setDbName($dbName) {
        $this->dbName = $dbName;
    }

    public static function setFileName($fileName) {
        self::$fileName = $fileName;
    }


}

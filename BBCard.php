<?php

include_once './DataBaseConnection.php';

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BBCard
 *
 * @author lorix
 */
class BBCard {
    //put your code here
    
    private $name;
    private $data;
    
    function __construct($name, $data) {
        $this->name = $name;
        $this->data = $data;
    }
    
    public function getName() {
        return $this->name;
    }

    public function getData() {
        return $this->data;
    }

    public function setName($name) {
        $this->name = $name;
    }

    public function setData($data) {
        $this->data = $data;
    }

    public static function getCardsFromDB($userID){
        DataBaseConnection::getDBConnectionInstance();
        $query = 'SELECT bb.name, date(bb.date_create)
                    FROM mytraining.BB_card bb
                        where bb.user_id = "'.$userID.'";';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }
        
        $bbCardArray = array();
        $i = 0;
        while($row=mysql_fetch_row($result)){
            $bbCardArray[$i] = new BBCard($row[0], $row[1]);
            $i++;
        }
        
        return $bbCardArray;
    }


}

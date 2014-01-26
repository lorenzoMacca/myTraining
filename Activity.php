<?php

include './DataBaseConnection.php';

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Activity
 *
 * @author lorenzo
 */
class Activity {
    //put your code here
    private $id;
    private $username;
    private $activityData;
    private $lastModifyData;
    private $trainingTime;
    private $weather;
    private $temperature;
    private $trainingType;
    
    function __construct($id, $username,  $activityData, $lastModifyData, $trainingTime, $weather, $temperature, $trainingType) {
        $this->id = $id;
        $this->username = $username;
        $this->activityData = $activityData;
        $this->lastModifyData = $lastModifyData;
        $this->trainingTime = $trainingTime;
        $this->weather = $weather;
        $this->temperature = $temperature;
        $this->trainingType = $trainingType;
    }
    
    /*
     * get all activity between l1 and l2 from database
     */
    public static function getActivityFromDB($userID, $l1, $l2){
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select a.id, u.username,a.activity_data, a.activity_modify, a.training_time, w.weather, w.temperature, a.training_type
                    from activity as a, mytraining.user as u, weather as w
                        where u.id = a.user_id
                            and a.weather_id = w.id
                            and u.id ='. $userID .'
                            order by a.id desc
                        limit '.$l1.','.$l2.';';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }
        
        $activityArray = array();
        $i = 0;
        while($row=mysql_fetch_row($result)){
            $activityArray[$i] = new Activity($row[0], $row[1], $row[2], $row[3], $row[4], $row[5], $row[6], $row[7]);
            $i++;
        }
        
        return $activityArray;
    }


    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getActivityData() {
        return $this->activityData;
    }

    public function setActivityData($activityData) {
        $this->activityData = $activityData;
    }

    public function getLastModifyData() {
        return $this->lastModifyData;
    }

    public function setLastModifyData($lastModifyData) {
        $this->lastModifyData = $lastModifyData;
    }

    public function getTrainingTime() {
        return $this->trainingTime;
    }

    public function setTrainingTime($trainingTime) {
        $this->trainingTime = $trainingTime;
    }

    public function getWeather() {
        return $this->weather;
    }

    public function setWeather($weather) {
        $this->weather = $weather;
    }

    public function getTemperature() {
        return $this->temperature;
    }

    public function setTemperature($temperature) {
        $this->temperature = $temperature;
    }

    public function getTrainingType() {
        return $this->trainingType;
    }

    public function setTrainingType($trainingType) {
        $this->trainingType = $trainingType;
    }

    public function getUsername() {
        return $this->username;
    }

    public function setUsername($username) {
        $this->username = $username;
    }
    
    public function __toString() {
        return $this->id
        .' '.$this->username
        .' '.$this->activityData
        .' '.$this->lastModifyData
        .' '.$this->trainingTime
        .' '.$this->weather
        .' '.$this->temperature
        .' '.$this->trainingType;
    }

}

?>

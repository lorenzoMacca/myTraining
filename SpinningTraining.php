<?php
include_once  './DataBaseConnection.php';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SpinningTraining
 *
 * @author lorenzo
 */
class SpinningTraining {

    //put your code here

    private $bpm;
    private $time;
    
    const ACTIVITY_SPINNING_INSERT_INTO_DB_CORRECTLY = 'ACTIVITY_SPINNING_INSERT_INTO_DB_CORRECTLY';
    const ERROR_TO_INSERT_ACTIVITY_INTO_DB = "ERROR_TO_INSERT_ACTIVITY_INTO_DB";
    const ERROR_DONT_FIND_LAST_ACTIVITY = "ERROR_DONT_FIND_LAST_ACTIVITY";
    const ERROR_ACTIVITY_NULL = "ERROR_ACTIVITY_NULL";
    const ERROR_INSERT_SPINNING_TRAINING = "ERROR_INSERT_SPINNING_TRAINING";
    
    function __construct($bpm, $time) {
        $this->bpm = $bpm;
        $this->time = $time;
    }
    
    
    public static function getSpinningTrainingFromActivityDB($activityID) {
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select spi.bpm, spi.`time` 
                    from spinning_training as spi 
                        where spi.activity_id = ' . $activityID . '
                            ;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $SPinningTrainingArray = array();
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $SPinningTrainingArray[$i] = new SpinningTraining($row[0], $row[1]);
            $i++;
        }

        return $SPinningTrainingArray;
    }
    
    
    public function __toString() {
        return '{ "bpm" :"' . $this->bpm . '","time" :"' . $this->time . '"}';
    }
    
    
    /**
     * 
     * @param type $activity    --> [user_id, activity_data, activity_hour, training_time, weather_id]
     * @param type $spinningTraining --> [$time, $bpm]
     * @return type
     */
    public static function insertSpinningTraining($activity, $spinningTraining) {
        DataBaseConnection::getDBConnectionInstance();
        mysql_query("SET AUTOCOMMIT=0");
        mysql_query("START TRANSACTION");
        $dataMySQLFormat = SpinningTraining::getDataMySQLFormat($activity[1], $activity[2]);
        $query = "insert into activity  (user_id, activity_data, training_time, weather_id, training_type)  values  ('" . $activity[0] . "', '" . $dataMySQLFormat . "', '" . $activity[3] . "', '" . $activity[4] . "','spi');";
        $result1 = mysql_query($query);
        if (!$result1) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return SpinningTraining::ERROR_TO_INSERT_ACTIVITY_INTO_DB;
        }

        /**
         * get last activity id to insert in gym training record
         */
        $activity_id = NULL;
        $query = "select max(id) from activity;";
        $result2 = mysql_query($query);
        if (!$result2) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return SpinningTraining::ERROR_DONT_FIND_LAST_ACTIVITY;
        } else {
            while ($row = mysql_fetch_row($result2)) {
                $activity_id = $row[0];
            }
        }

        if ($activity_id == NULL) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return SpinningTraining::ERROR_ACTIVITY_NULL;
        }
        
        //INSERT SPINNING TRAINING
        $query = "insert into spinning_training (bpm,`time`, activity_id) VALUES ('".$spinningTraining[0]."', '".$spinningTraining[1]."', '".$activity_id."');";
        $result5 = mysql_query($query);
        if (!$result5) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return SpinningTraining::ERROR_INSERT_SPINNING_TRAINING;
        }
        
        mysql_query("COMMIT");
        mysql_query("SET AUTOCOMMIT=0");
        return SpinningTraining::ACTIVITY_SPINNING_INSERT_INTO_DB_CORRECTLY;
    }

    
     public static function getDataMySQLFormat($data, $hour) {
        list($month, $day, $year) = explode('/', $data);
        return $year . '-' . $month . '-' . $day . ' ' . $hour;
    }

    public function getBpm() {
        return $this->bpm;
    }

    public function setBpm($bpm) {
        $this->bpm = $bpm;
    }

    public function getTime() {
        return $this->time;
    }

    public function setTime($time) {
        $this->time = $time;
    }



}

?>

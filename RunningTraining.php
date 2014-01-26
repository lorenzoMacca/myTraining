<?php

include_once  './DataBaseConnection.php';



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RunningTraining
 *
 * @author lorenzo
 */
class RunningTraining {

    //put your code here

    private $path;
    private $bpm;
    private $time;
    private $shoes;

    const ACTIVITY_RUN_INSERT_INTO_DB_CORRECTLY = 'ACTIVITY_RUN_INSERT_INTO_DB_CORRECTLY';
    const ERROR_TO_INSERT_ACTIVITY_INTO_DB = "ERROR_TO_INSERT_ACTIVITY_INTO_DB";
    const ERROR_DONT_FIND_LAST_ACTIVITY = "ERROR_DONT_FIND_LAST_ACTIVITY";
    const ERROR_ACTIVITY_NULL = "ERROR_ACTIVITY_NULL";
    const ERROR_INSERT_RUN_TRAINING = "ERROR_INSERT_RUN_TRAINING";
    const ERROR_INSERT_RUN_TRAINING_PATH_DONT_FIND = "ERROR_INSERT_RUN_TRAINING_PATH_DONT_FIND";
    const ERROR_INSERT_RUN_TRAINING_SHOES_DONT_FIND = "ERROR_INSERT_RUN_TRAINING_SHOES_DONT_FIND";

    function __construct($path, $bpm, $time, $shoes) {
        $this->path = $path;
        $this->bpm = $bpm;
        $this->time = $time;
        $this->shoes = $shoes;
    }

    /**
     * 
     * @param type $activity    --> [user_id, activity_data, activity_hour, training_time, weather_id]
     * @param type $runTraining --> [$path, $bpm, $time, $shoes]
     * @return type
     */
    public static function insertRunningTraining($activity, $runTraining) {
        DataBaseConnection::getDBConnectionInstance();
        mysql_query("SET AUTOCOMMIT=0");
        mysql_query("START TRANSACTION");
        $dataMySQLFormat = RunningTraining::getDataMySQLFormat($activity[1], $activity[2]);
        $query = "insert into activity  (user_id, activity_data, training_time, weather_id, training_type)  values  ('" . $activity[0] . "', '" . $dataMySQLFormat . "', '" . $activity[3] . "', '" . $activity[4] . "','run');";
        $result1 = mysql_query($query);
        if (!$result1) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_TO_INSERT_ACTIVITY_INTO_DB;
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
            return RunningTraining::ERROR_DONT_FIND_LAST_ACTIVITY;
        } else {
            while ($row = mysql_fetch_row($result2)) {
                $activity_id = $row[0];
            }
        }

        if ($activity_id == NULL) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_ACTIVITY_NULL;
        }

        /* insert running training */
        
        //GET PATH
        $path = trim($runTraining[0]);
        $path_id = NULL;
        $query = "select id from running_path where path_name = '".$path."';";
        $result3 = mysql_query($query);
        if (!$result3) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_INSERT_RUN_TRAINING_PATH_DONT_FIND.' '.$query;
        } else {
            while ($row = mysql_fetch_row($result3)) {
                $path_id = $row[0];
            }
        }
        
        if ($path_id == NULL) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_INSERT_RUN_TRAINING_PATH_DONT_FIND.' '.$query;
        }
        
        //GET SHOES
        list($a, $b) = explode('--', $runTraining[3]);
        $shoes = trim($a);
        $brand = trim($b);
        $shoes_id = NULL;
        $query = "select id from shoes where shoes_name = '".$shoes."' and brand = '".$brand."';";
        $result4 = mysql_query($query);
        if (!$result4) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_INSERT_RUN_TRAINING_SHOES_DONT_FIND.' '.$query;
        } else {
            while ($row = mysql_fetch_row($result4)) {
                $shoes_id = $row[0];
            }
        }
        
        if ($shoes_id == NULL) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_INSERT_RUN_TRAINING_SHOES_DONT_FIND.' '.$query;
        }
        
        //INSERT RUNNING TRAINING
        $query = "insert into running_training (path_id, bpm,`time`, activity_id, shoes_id) VALUES ('".$path_id."', '".$runTraining[1]."', '".$runTraining[2]."', '".$activity_id."', '".$shoes_id."');";
        $result5 = mysql_query($query);
        if (!$result5) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return RunningTraining::ERROR_INSERT_RUN_TRAINING_SHOES_DONT_FIND;
        }
        
        mysql_query("COMMIT");
        mysql_query("SET AUTOCOMMIT=0");
        return RunningTraining::ACTIVITY_RUN_INSERT_INTO_DB_CORRECTLY;
    }

    public static function getRunningPath() {
        DataBaseConnection::getDBConnectionInstance();
        $path = array();
        $query = 'select path_name from running_path;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $path[$i] = $row[0];
            $i++;
        }

        return $path;
    }
    
    public static function getRunningShoes() {
        DataBaseConnection::getDBConnectionInstance();
        $path = array();
        $query = 'select shoes_name, brand from shoes;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $path[$i] = $row[0].' -- '.$row[1];
            $i++;
        }

        return $path;
    }

    public static function getRunningTrainingFromActivityDB($activityID) {
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select p.path_name , r.bpm, r.`time`, s.shoes_name, s.brand 
                    from running_training as r, running_path as p, shoes as s 
                        where r.activity_id = ' . $activityID . '
                            and r.path_id = p.id
                            and r.shoes_id = s.id;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $runningTrainingArray = array();
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $runningTrainingArray[$i] = new RunningTraining($row[0], $row[1], $row[2], $row[3] . ' - ' . $row[4]);
            $i++;
        }

        return $runningTrainingArray;
    }
    
    public static function getDataMySQLFormat($data, $hour) {
        list($month, $day, $year) = explode('/', $data);
        return $year . '-' . $month . '-' . $day . ' ' . $hour;
    }

    public function getPath() {
        return $this->path;
    }

    public function setPath($path) {
        $this->path = $path;
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

    public function getShoes() {
        return $this->shoes;
    }

    public function setShoes($shoes) {
        $this->shoes = $shoes;
    }

    public function __toString() {
        return '{ "path" :"' . $this->path . '","bpm" :"' . $this->bpm . '","time" :"' . $this->time . '","shoes" :"' . $this->shoes . '"}';
    }

}

?>

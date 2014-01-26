<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include './DataBaseConnection.php';

/**
 * Description of GymTraining
 *
 * @author lorenzo
 */
class GymTraining {

    //put your code here

    private $name;
    private $serie;
    private $rep;
    private $weight;
    private $equipment;

    const ACTIVITY_INSERT_INTO_DB_CORRECTLY = "ACTIVITY_INSERT_INTO_DB_CORRECTLY";
    const ERROR_TO_INSERT_ACTIVITY_INTO_DB = "ERROR_TO_INSERT_ACTIVITY_INTO_DB";
    const ERROR_DONT_FIND_LAST_ACTIVITY = "ERROR_DONT_FIND_LAST_ACTIVITY";
    const ERROR_ACTIVITY_NULL = "ERROR_ACTIVITY_NULL";
    const ERROR_INSERT_GYM_TRAINING = "ERROR_INSERT_GYM_TRAINING";

    function __construct($name, $serie, $rep, $weight, $equipment) {
        $this->name = $name;
        $this->serie = $serie;
        $this->rep = $rep;
        $this->weight = $weight;
        $this->equipment = $equipment;
    }

    /**
     * generate datetime for mysql :from MM/DD/YYYY TO YYYY-MM-DD HH:MM:SS
     * 
     * @param type $data of activity
     * @param type $hour of activity
     */
    public static function getDataMySQLFormat($data, $hour) {
        list($month, $day, $year) = explode('/', $data);
        return $year . '-' . $month . '-' . $day . ' ' . $hour;
    }

    /**
     * 
     * @param type $activity --> [$dataGym, $hour, $duration, $weight, $id]
     * @param type $gymTrainings --> list of training
     */
    public static function insertGymTraining($activity, $gymTrainings) {
        DataBaseConnection::getDBConnectionInstance();
        mysql_query("SET AUTOCOMMIT=0");
        mysql_query("START TRANSACTION");
        $dataMySQLFormat = GymTraining::getDataMySQLFormat($activity[0], $activity[1]);
        $query = "insert into activity  (user_id, activity_data, training_time, weather_id, training_type)  values  ('" . $activity[4] . "', '" . $dataMySQLFormat . "', '" . $activity[2] . "', '" . $activity[3] . "','gym');";
        $result1 = mysql_query($query);
        if (!$result1) {
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return GymTraining::ERROR_TO_INSERT_ACTIVITY_INTO_DB;
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
            return GymTraining::ERROR_DONT_FIND_LAST_ACTIVITY;
        }else{
            while ($row = mysql_fetch_row($result2)) {
                $activity_id = $row[0];
            }
        }
        
        if( $activity_id == NULL){
            mysql_query("ROLLBACK");
            mysql_query("SET AUTOCOMMIT=1");
            return GymTraining::ERROR_ACTIVITY_NULL;
        }
        
        $exercise = GymTraining::getExerciseGym();

        /**
         * insert all gym training
         */
        $current_exercise = "AAABBBCCC@@@@";
        $rep = 1;
        for ($i = 0; $i < count($gymTrainings); $i++) {
            if ($gymTrainings[$i][0] != NULL && $gymTrainings[$i][0] != '') {
                //echo '<br/>' . $gymTrainings[$i][0] . ' ' . $gymTrainings[$i][1] . ' ' . $gymTrainings[$i][2];
                if( $gymTrainings[$i][0] == $current_exercise ){
                    $rep++;
                }else{
                    $rep=1;
                    $current_exercise = $gymTrainings[$i][0];
                }
                $query = "insert into gym_training  (activity_id,exercise_id, serie,repetitions, weight)  values('".$activity_id."', '".$exercise[$gymTrainings[$i][0]]."', '".$rep."', '".$gymTrainings[$i][2]."', '".$gymTrainings[$i][1]."');";
                //echo $query;
                $result3 = mysql_query($query);
                if (!$result3) {
                    mysql_query("ROLLBACK");
                    mysql_query("SET AUTOCOMMIT=1");
                    return GymTraining::ERROR_INSERT_GYM_TRAINING;
                }
            }
        }

        mysql_query("COMMIT");
        mysql_query("SET AUTOCOMMIT=0");
        return GymTraining::ACTIVITY_INSERT_INTO_DB_CORRECTLY;
    }

    public static function getGymTrainingFromActivityDB($activityID) {
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select e.exsercise_name as NAME,
                    t.serie as SERIE,
                    t.repetitions as REP,
                    t.weight as WEIGHT,
                    eq.name_equipment as EQUIPMENT
                      from gym_training as t, gym_exsercise as e, equipment as eq, activity as a, body as b
                        where t.activity_id = a.id
                          and t.exercise_id = e.id
                          and e.equipment_id = eq.id
                          and e.part_of_body_id = b.id
                          and t.activity_id = ' . $activityID . '
                            order by t.id;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $gymTrainingArray = array();
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $gymTrainingArray[$i] = new GymTraining($row[0], $row[1], $row[2], $row[3], $row[4]);
            $i++;
        }

        return $gymTrainingArray;
    }

    public static function getLastGymTrainingFromActivityAndTypeDB() {
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select e.exsercise_name as NAME,
                    t.serie as SERIE,
                    t.repetitions as REP,
                    t.weight as WEIGHT,
                    eq.name_equipment as EQUIPMENT
                      from gym_training as t, gym_exsercise as e, equipment as eq, activity as a, body as b
                        where t.activity_id = a.id
                          and t.exercise_id = e.id
                          and e.equipment_id = eq.id
                          and e.part_of_body_id = b.id
                          and a.id in (
                            select max(t1.activity_id)
                              from gym_training as t1, activity as a1
                                where t1.activity_id = a1.id
                                and t1.part_of_body = 1
                                and a.training_type = "gym"
                          )
                            order by t.id;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $gymTrainingArray = array();
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $gymTrainingArray[$i] = new GymTraining($row[0], $row[1], $row[2], $row[3], $row[4]);
            $i++;
        }

        return $gymTrainingArray;
    }

    public static function getAllGymExerciseName() {
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select distinct e.exsercise_name from gym_exsercise as e;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $gymExercise = array();
        $i = 0;
        while ($row = mysql_fetch_row($result)) {
            $gymExercise[$i] = $row[0];
            $i++;
        }

        return $gymExercise;
    }
    
    /**
     * return an associative array with gym exercise: name => id
     */
    public static function getExerciseGym(){
        DataBaseConnection::getDBConnectionInstance();
        $query = 'select distinct e.exsercise_name, e.id from gym_exsercise as e;';
        $result = mysql_query($query);
        if (!$result) {
            die('Invalid query: ' . mysql_error());
        }

        $gymExercise=NULL;
        while ($row = mysql_fetch_row($result)) {
            $gymExercise[$row[0]] = $row[1];
        }

        return $gymExercise;
        
    }

    public function getName() {
        return $this->name;
    }

    public function setName($name) {
        $this->name = $name;
    }

    public function getSerie() {
        return $this->serie;
    }

    public function setSerie($serie) {
        $this->serie = $serie;
    }

    public function getRep() {
        return $this->rep;
    }

    public function setRep($rep) {
        $this->rep = $rep;
    }

    public function getWeight() {
        return $this->weight;
    }

    public function setWeight($weight) {
        $this->weight = $weight;
    }

    public function getEquipment() {
        return $this->equipment;
    }

    public function setEquipment($equipment) {
        $this->equipment = $equipment;
    }

    public function __toString() {
        return '{"name" : "' . $this->name . '", "serie": "' . $this->serie . '", "rep": "' . $this->rep . '", "weight": "' . $this->weight . '", "equipment": "' . $this->equipment . '" }';
    }

}

?>

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LogMyTraining
 *
 * @author lorenzo
 */
class LogMyTraining {

    //put your code here
    
    private static $fileName = 'mytrainingLog.log';

    public static function Log($userId, $username, $message) {
        $today = getdate();
        $text = "[ DATA:".$today['year']."-".$today['mon']."-".$today['mday']." ".$today['hours'].":".$today['minutes'].":".$today['seconds']." - USER:".$username." - ID:".$userId." ] : ".$message."\n";    
        file_put_contents(LogMyTraining::$fileName,$text, FILE_APPEND | LOCK_EX);
    }

}

?>

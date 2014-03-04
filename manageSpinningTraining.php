<?php

include './SpinningTraining.php';
include './InitSession.php';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*CHECK DATA BEFORE TO LAUNCH INSERT PROCEDURE :)*/
$dataGym = $_POST['dataGym'];
$hour = $_POST['hour'];
$duration = $_POST['duration'];
$bpm = $_POST['bpm'];
$time = $_POST['time'];
$weather = $_POST['weather'];

session_start();
$user_id = $_SESSION[InitSession::USER_ID];
session_write_close();

//[user_id, activity_data, activity_hour, training_time, weather_id]
$activity = [$user_id, $dataGym, $hour, $duration, $weather];

$spinningTraining = [$time, $bpm];

$result = SpinningTraining::insertSpinningTraining($activity, $spinningTraining);

echo '{"result" :"'.$result.'"}';

?>

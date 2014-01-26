<?php

include './RunningTraining.php';
include './InitSession.php';
include './Mail/SendMail.php';

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*CHECK DATA BEFORE TO LAUNCH INSERT PROCEDURE :)*/
$dataGym = $_POST['dataGym'];
$hour = $_POST['hour'];
$duration = $_POST['duration'];
$shoes = $_POST['shoes'];
$path = $_POST['path'];
$bpm = $_POST['bpm'];
$time = $_POST['time'];
$weather = $_POST['weather'];

session_start();
$user_id = $_SESSION[InitSession::USER_ID];
session_write_close();

//[user_id, activity_data, activity_hour, training_time, weather_id]
$activity = [$user_id, $dataGym, $hour, $duration, $weather];

$runtraining = [$path, $bpm, $time, $shoes];

$result = RunningTraining::insertRunningTraining($activity, $runtraining);

echo '{"result" :"'.$result.'"}';

?>

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include './GymTraining.php';
include './RunningTraining.php';

$req = $_GET["req"];
$activityId = $_GET["activityId"];
$type = $_GET["type"];

if ($req === 'getTraining') {
    if ($type == 'gym') { // send a gym training
        $gymTrainings = GymTraining::getGymTrainingFromActivityDB($activityId);
        echo '{"gymtrainings":[';
        for ($i = 0; $i < count($gymTrainings); $i++) {
            echo $gymTrainings [$i];
            if ($i != count($gymTrainings) - 1) {
                echo ',';
            }
        }
        echo ']}';
    } else if ($type == 'run') { // send a running training
        $runningTraining = RunningTraining::getRunningTrainingFromActivityDB($activityId);
        echo '{"runningtrainings":[';
        for ($i = 0; $i < count($runningTraining); $i++) {
            echo $runningTraining [$i];
            if ($i != count($runningTraining) - 1) {
                echo ',';
            }
        }
        echo ']}';
    }
}
?>

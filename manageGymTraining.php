<?php

include './InitSession.php';
include './GymTraining.php';
include './Mail/SendMail.php';

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/* CHECK DATA BEFORE TO LAUNCH INSERT PROCEDURE :) */

$req = $_POST['req'];

if ($req == 'sendGymTrainingData') {

    $gymtrainingData = $_POST['gymtrainingData'];
    $dataGym = $_POST['dataGym'];
    $hour = $_POST['hour'];
    $duration = $_POST['duration'];
    $weight = $_POST['weight'];

    session_start();
    $id = $_SESSION[InitSession::USER_ID];
    session_write_close();

    $activity = [ $dataGym, $hour, $duration, $weight, $id];

    $result = GymTraining::insertGymTraining($activity, $gymtrainingData);

    echo '{"result" :"' . $result . '"}';

    /* send an email to user */
    SendMail:: sendGymTrainingEmail('<lorenzo.cozza@hotmail.com>', 'MYTRAINING GYM ACTIVITY ' . $dataGym, 'this email is a test');
} else if ($req == 'loadExerciseBBCard') {
    $idBBCard = $_POST['idBBCard'];
    $dayBBCard = $_POST['dayBBCard'];
    $exerciseBBCard = GymTraining::getGymExerciseFromBBCard($idBBCard, $dayBBCard);
    
    echo '{ "exercise" : [';
    for( $i=0;  $i<count($exerciseBBCard); $i++ ){
        echo $exerciseBBCard[$i];
        if( $i != count($exerciseBBCard)-1 ){
            echo ',';
        }
    }
    echo ']}';
}
?>

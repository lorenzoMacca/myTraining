<?php
    include './InitSession.php';
    include './Activity.php';
    include_once './utils/Utils.php';
    
    
    session_start();
    if (isset($_SESSION[InitSession::LOGIN])) {
        if($_SESSION[InitSession::LOGIN] != 1 ){
            header( 'Location: http://localhost/MyTraining/index.php' ) ;
        }
    } else {
        header( 'Location: http://localhost/MyTraining/index.php' ) ;
    }
    session_commit();

?>

<div id="menuPageTitle">
    <!-- show first twenty activity -->
    <div id="activities"> 
        
    <?php 
        echo '<div class="activityTitle">';
        echo '<div class="activityID">ID</div>';
        echo '<div class="activityUser">USER</div>';
        echo '<div class="activityData">DATA</div>';
        echo '<div class="activityLastData">LAST DATA</div>';
        echo '<div class="activityEwather">WE</div>';
        echo '<div class="activityTeml">TEM</div>';
        echo '<div class="activityType">TYPE</div>';
        echo '<div class="activityTime">TI</div>';
        echo '<div >OP</div>';
        echo '</div>';
        
        session_start();
        $training_num = $_SESSION[InitSession::TRAINING_NUM];
        session_write_close();
    
        $activities = Activity::getActivityFromDB('1', 0, $training_num);
        
        $dataPrec = '';
        $dataCorr = '';
        
        for($i = 0; $i<count($activities); $i++){
            $data_ = substr($activities[$i]->getActivityData(),0,10);
            $dataCorr = Utils::getMonthFromNum($data_).' '.substr($data_, 0, 4);
            if( $dataCorr != $dataPrec ){
                $dataPrec = $dataCorr;
                echo '<div>'.$dataCorr.'</div>';
            }
            
            echo '<div class="activity" id="activity'.$i.'">';
            echo '<div class="activityID">'.$activities[$i]->getId().'</div>';
            echo '<div class="activityUser">'.$activities[$i]->getUsername().'</div>';
            echo '<div class="activityData">'.substr($activities[$i]->getActivityData(),0,10).'</div>';
            echo '<div class="activityLastData">'.substr($activities[$i]->getLastModifyData(),0,10).'</div>';
            echo '<div class="activityEwather">'.$activities[$i]->getWeather().'</div>';
            echo '<div class="activityTeml">'.$activities[$i]->getTemperature().'</div>';
            echo '<div class="activityType">'.$activities[$i]->getTrainingType().'</div>';
            echo '<div class="activityTime">'.$activities[$i]->getTrainingTime().'</div>';
            echo '<input type="button"  id="activityButton'.$i.'" value="+"/>';
            echo '<div class="gymContent" id="gymTrainingContent'.$i.'"></div>';
            echo '</div>';
        }
        
    ?>
        <div id="old_training">
            old_training
        </div>
    </div>
    
</div>

<script>
    STATE="HOME";
    
    activitiesId = new Array();
    
    <?php 
        for($i = 0; $i<count($activities); $i++){
            echo 'activitiesId['.$i.']="0";';
            echo '$("[id=activityButton'.$i.']").click(function(){
                        if(activitiesId['.$i.']==="0"){
                            activitiesId['.$i.']="1";
                            getGymTraining('.$activities[$i]->getId().', '.$i.',"'.$activities[$i]->getTrainingType().'");    
                        }else{
                             $("[id=gymTrainingContent'.$i.']").css("display","none");
                             /*$("[id=activity'.$i.']").css("height","27px");*/
                                 closeTraining('.$activities[$i]->getId().', '.$i.',"'.$activities[$i]->getTrainingType().'");   
                            activitiesId['.$i.']="0"; 
                        }
                    });';
        }
    ?>
        
        
    $('[id=old_training]').click(function (){
        //alert('OTHER TRAINIG');
    });
</script>
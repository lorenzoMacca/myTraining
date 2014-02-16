<?php
include './RunningTraining.php';
?>

<div id="insertRunningWorkoutContainer">

    <div id="addActivityMetadata">
        <div id="dataInsertWorkout">
            <span>DATE:</span><input type="text" id="datepicker" size="20"/>
        </div>
        <div id="hourInsertWorkout">
            <span>H:</span><input type="text" id="hourGym" size="15"/>
        </div>
        <div id="durationInsertWorkout">
            <span>DURATION:</span><input type="number"  id="durationGym" size="15"/>
        </div>
    </div>

    <div id="runningContentdata">

        <table>
            <tr>
                <!--<td><img src="images/icon/distance.png" /></td>-->
                <td>
                    <select id="path">
                        <?php
                        $path = RunningTraining::getRunningPath();
                        for ($i = 0; $i < count($path); $i++) {
                            echo '<option>' . $path[$i] . '</option>';
                        }
                        ?>
                    </select>
                </td>    
                <!--<td><img src="images/icon/shoes.png" /></td>-->
                <td>
                    <select id="shoes">
                        <?php
                        $shoes = RunningTraining::getRunningShoes();
                        for ($i = 0; $i < count($shoes); $i++) {
                            echo '<option>' . $shoes[$i] . '</option>';
                        }
                        //echo '<option>BBB</option>';
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <!--<td><img src="images/icon/bpm.png" /></td>-->
                <td><input type="number" id="bpm" placeholder="bmp"/></td>
                <!--<td><img src="images/icon/time.png" /></td>-->
                <td><input type="number" id="time" placeholder="time"/></td>
            </tr>
        </table>
    </div>

    <button id="sendRunningTraining">SEND RUNNNING TRAINING</button>
</div>


<script>
    $(function() {
        $("#datepicker").datepicker();
    });

    $('[id=sendRunningTraining]').click(function() {
        dataActivity = $('[id=datepicker]').val();
        hourGym = $('[id=hourGym]').val();
        durationGym = $('[id=durationGym]').val();
        shoes = $('[id=shoes]').val();
        path = $('[id=path]').val();
        bpm = $('[id=bpm]').val();
        time = $('[id=time]').val();
       /* dataGym, hour, duration, shoes, path, bpm, time, weather*/
        sendRunningTrainingdataToServer(dataActivity, hourGym, durationGym, shoes, path, bpm, time, 1);
    });
</script>

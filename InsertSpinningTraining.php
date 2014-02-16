<?php

?>

<div id="insertSpinningWorkoutContainer">

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

    <div id="spinningContentData">  
        <table>
            <tr>
                <td>
                    <input type="number" id="spinningTime" placeholder="TIME" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="number" id="spinningBpm" placeholder="BPM" />
                </td>
            </tr>
        </table>
        
    </div>

    <button id="sendSpinningTraining">SEND SPINNING TRAINING</button>
</div>


<script>
    $(function() {
        $("#datepicker").datepicker();
    });

    $('[id=sendSpinningTraining]').click(function() {
        dataActivity = $('[id=datepicker]').val();
        hourGym = $('[id=hourGym]').val();
        durationGym = $('[id=durationGym]').val();
        bpm = $('[id=spinningBpm]').val();
        time = $('[id=spinningTime]').val();
       /* dataGym, hour, duration, shoes, path, bpm, time, weather*/
        sendSpinningTrainingdataToServer(dataActivity, hourGym, durationGym, bpm, time, 1);
    });
</script>


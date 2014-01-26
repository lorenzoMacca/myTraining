<?php

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

        
    </div>

    <button id="sendSpinningTraining">SEND SPINNING TRAINING</button>
</div>


<script>
    $(function() {
        $("#datepicker").datepicker();
    });

    
</script>


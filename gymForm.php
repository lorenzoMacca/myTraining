<ol class="breadcrumb">
  <li><a href="#">HomePage</a></li>
  <li><a href="#">workout</a></li>
  <li class="active">gym</li>
</ol>

<div class="panel panel-success">
	<div class="panel-heading">New gym workout</div>
	<div class="panel-body">
 		<div class="input-group MT_GYM_FORM_FIELD">
  			<span class="input-group-addon">DATE</span>
  			<input type="date" class="form-control" placeholder="insert a workout's date"/>
		</div>
		<div class="input-group MT_GYM_FORM_FIELD">
  			<span class="input-group-addon">HOUR</span>
  			<input type="time" class="form-control" placeholder="insert a workout's hour"/>
		</div>
		<div class="input-group MT_GYM_FORM_FIELD">
  			<span class="input-group-addon">TIME</span>
  			<input type="text" class="form-control" placeholder="insert a workout's hour"/>
		</div>
            
                <div class="input-group MT_GYM_FORM_FIELD">
                    <span>Select BB CARD: </span>
                    <select id="bb_card_value">
                        <option value="null">Select a BB CARD</option>
                        <?php
                        include './BBCard.php  ';
                        $cards = BBCard::getCardsFromDB(1);
                        for ($i = 0; $i < count($cards); $i++) {
                            $name = $cards[$i]->getName();
                            echo '<option value="' . $name . ';' . $cards[$i]->getNumberOfday(). ';'. $cards[$i]->getId() . '">' . $name . '</option>';
                        }
                        ?>
                    </select>
                </div>
            
                <div id="select_number_of_day">
                    <span>Select BB  Day:  </span>
                    <select id="select_BB_card_day" >
                        <option>A</option>
                        <option>A</option>
                    </select>
                </div>

                <div id="example" class="handsontable"></div>

                <button id="sendWorkout">SEND WORKOUT</button>
                <a href="#" download="">
                    <button id="PrintCard">PRINT WORKOUT</button>
                </a>
		
		<div class="input-group MT_GYM_FORM_FIELD">
			<button type="button" class="btn btn-success MT_GYM_FORM_BUTTON">SAVE</button>
			<button type="button" class="btn btn-danger MT_GYM_FORM_BUTTON">CANCEL</button>
		</div>
            
	</div>
</div>

<script>
    
    
    $('[id=PrintCard]').click(function (){
        
    });

    $('[id=bb_card_value]').change(function() {
        loadBBCard();
    });
    
    $('[id=select_BB_card_day]').change(function() {
         bbCardId = $('[id=bb_card_value]').val().split(";")[2];
         day = $('[id=select_BB_card_day]').val();
       // alert(valueCardElement+" "+dayCardElement);
        loadExerciseBBCArdFromServer(bbCardId,day);
    });

<?php
include './GymTraining.php';

echo 'var exercises = [';
$exercises = GymTraining::getAllGymExerciseName();
for ($i = 0; $i < count($exercises); $i++) {
    echo '"' . $exercises[$i] . '"';
    if ($i != count($exercises) - 1) {
        echo ',';
    }
}
echo '];';
?>

    $(document).ready(function() {

        var data = [
            ["", "", ""]
        ];

        $('#example').handsontable({
            data: data,
            colHeaders: ["EXERCISE", "WEIGHT", "REPETITIONS"],
            minSpareRows: 2,
            rowHeaders: true,
            contextMenu: true,
            colWidths: [175, 90, 90],
            columns: [
                {
                    type: 'dropdown',
                    source: exercises
                },
                {type: 'numeric'},
                {type: 'numeric'}
            ]
        });


        /*function bindDumpButton() {
         $('body').on('click', 'button[name=dump]', function() {
         var dump = $(this).data('dump');
         var $container = $(dump);
         console.log('data of ' + dump, $container.handsontable('getData'));
         });
         }
         bindDumpButton();*/

        $('[id=sendWorkout]').click(function() {
            data = $('#example').handsontable('getData');
            dataActivity = $('[id=datepicker]').val();
            hourGym = $('[id=hourGym]').val();
            durationGym = $('[id=durationGym]').val();
            sendGymTrainingDataToServer(data, dataActivity, hourGym, durationGym, 1);
        });

        $(function() {
            $("#datepicker").datepicker();
        });

    });
</script>


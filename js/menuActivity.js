/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var STATE = 'LOGIN';


function doLogin(username, password) {
    $.ajax("doLogin.php", {
        data: {
            req: "login",
            username: username,
            password: password
        },
        type: "GET"
    }).done(function(msg) {
                alert(msg);
        userJSON = JSON.parse(msg);

        if (userJSON.connect === 'OK') {
            $("[id=center]").load("./menuPage.php");
            STATE = 'HOME';
        } else {
            $("[id=center]").append("<div>ERROR IN LOGIN, CHECK USERNAME OR PASSWORD</div>");
        }
    }) .fail(function(msg) {
		alert( "error" );
		$("[id=center]").load("./gymForm.php");
	}).always(function() {
		//alert( "complete" );
                $("[id=center]").load("./gymForm.php");
	});
}

function sendSpinningTrainingdataToServer(dataGym, hour, duration, bpm, time, weather) {
    var dataExpression = /[0-9][0-9][/][0-9][0-9][/][0-9][0-9][0-9][0-9]/;
    if (!dataExpression.test(dataGym)) {
        alert('check the data!!!');
        return;
    }

    //validate hour input before to send 
    var expression = /[0-2][0-9]:[0-5][0-9]/;
    if (!expression.test(hour)) {
        alert('check the hour!!!');
        return;
    }

    $.ajax("./manageSpinningTraining.php", {
        data: {
            req: "sendSpinningTrainingData",
            dataGym: dataGym,
            hour: hour,
            duration: duration,
            bpm: bpm,
            time: time,
            weather: weather
        },
        type: "POST"
    }).done(function(msg) {
        //alert(msg);
        userJSON = JSON.parse(msg);
        alert(userJSON.result);
        toHOME();
    });
}

function sendRunningTrainingdataToServer(dataGym, hour, duration, shoes, path, bpm, time, weather) {
    //alert(''+dataGym+' '+hour+' '+duration+' '+path+' '+shoes+' '+bpm+' '+time);

    //validate data input before to send
    var dataExpression = /[0-9][0-9][/][0-9][0-9][/][0-9][0-9][0-9][0-9]/;
    if (!dataExpression.test(dataGym)) {
        alert('check the data!!!');
        return;
    }

    //validate hour input before to send 
    var expression = /[0-2][0-9]:[0-5][0-9]/;
    if (!expression.test(hour)) {
        alert('check the hour!!!');
        return;
    }

    $.ajax("./manageRunningTraining.php", {
        data: {
            req: "sendRunningTrainingData",
            dataGym: dataGym,
            hour: hour,
            duration: duration,
            shoes: shoes,
            path: path,
            bpm: bpm,
            time: time,
            weather: weather
        },
        type: "POST"
    }).done(function(msg) {
        //alert(msg);
        userJSON = JSON.parse(msg);
        alert(userJSON.result);
        toHOME();
    });
}

function sendGymTrainingDataToServer(gymtrainingData, dataGym, hour, duration, weight) {

    //validate data input before to send
    var dataExpression = /[0-9][0-9][/][0-9][0-9][/][0-9][0-9][0-9][0-9]/;
    if (!dataExpression.test(dataGym)) {
        alert('check the data!!!');
        return;
    }

    //validate hour input before to send 
    var expression = /[0-2][0-9]:[0-5][0-9]/;
    if (!expression.test(hour)) {
        alert('check the hour!!!');
        return;
    }

    $.ajax("./manageGymTraining.php", {
        data: {
            req: "sendGymTrainingData",
            gymtrainingData: gymtrainingData,
            dataGym: dataGym,
            hour: hour,
            duration: duration,
            weight: weight
        },
        type: "POST"
    }).done(function(msg) {
        //alert(msg);
        userJSON = JSON.parse(msg);
        alert(userJSON.result);
        toHOME();
    });
}

function getGymTraining(activityId, id, type) {
    //alert(type);
    $.ajax("getTraining.php", {
        data: {
            req: "getTraining",
            activityId: activityId,
            type: type
        },
        type: "GET"
    }).done(function(msg) {
        //alert(msg);

        var gymTriningsJSON = JSON.parse(msg);

        if (type === 'gym') {
            var code = '<table border="2" id="tableGymTraining' + id + '" >';

            code += '<tr>';
            code += '<th>NAME</th>';
            code += '<th>SERIE</th>';
            code += '<th>REP</th>';
            code += '<th>WEIGHT</th>';
            code += '<th>EQUIPMENT</th>';
            code += '</tr>';

            for (var i = 0; i < gymTriningsJSON.gymtrainings.length; i++) {
                if (i % 2 === 0) {
                    code += '<tr class="a">';
                } else {
                    code += '<tr class="b">';
                }
                code += '<td>' + gymTriningsJSON.gymtrainings[i].name + '</td>';
                code += '<td>' + gymTriningsJSON.gymtrainings[i].serie + '</td>';
                code += '<td>' + gymTriningsJSON.gymtrainings[i].rep + '</td>';
                code += '<td>' + gymTriningsJSON.gymtrainings[i].weight + '</td>';
                code += '<td>' + gymTriningsJSON.gymtrainings[i].equipment + '</td>';
                code += '</tr>';
            }

            code += '</table>';

            $("[id=gymTrainingContent" + id + "]").html(code).show(400);
            $('[id=tableGymTraining' + id + ']').css("border-collapse", "collapse").css("border-color", "#9828c6").css("margin-bottom", "10px");
            /*$("[id=activity"+id+"]").css("height","400px");*/
            /*if(userJSON.connect === 'OK'){
             $("[id=center]").load("./menuPage.php");
             }else{
             $("[id=center]").append("<div>ERROR IN LOGIN, CHECK USERNAME OR PASSWORD</div>");
             }*/
        } else if (type === 'run') {
            var code = '<table border="2" id="tableRunTraining" >';
            code += '<tr class="a">';
            code += '<td>PATH</td>';
            code += '<td>' + gymTriningsJSON.runningtrainings[0].path + '</td>';
            code += '</tr>';
            code += '<tr class="b">';
            code += '<td>TIME</td>';
            code += '<td>' + gymTriningsJSON.runningtrainings[0].time + '</td>';
            code += '</tr>';
            code += '<tr class="a">';
            code += '<td>BPM</td>';
            code += '<td>' + gymTriningsJSON.runningtrainings[0].bpm + '</td>';
            code += '</tr>';
            code += '<tr class="b">';
            code += '<td>SHOES</td>';
            code += '<td>' + gymTriningsJSON.runningtrainings[0].shoes + '</td>';
            code += '</tr>';
            code += '</table>';

            /*INSERT GOOGLE MAP*/

            code += '<div id="map-canvas" style="width: 575px; height: 300px">MAPPA</div>';


            $("[id=gymTrainingContent" + id + "]").html(code).show(400);
            $('[id=tableRunTraining]').css("border-collapse", "collapse").css("border-color", "#9828c6").css("margin-bottom", "10px");
            initialize();
            calcRoute();
        } else if (type === 'spi') {
            var code = '<table border="2" id="tableRunTraining" >';
            code += '<tr class="a">';
            code += '<td>TIME</td>';
            code += '<td>' + gymTriningsJSON.spinningtrainings[0].time + '</td>';
            code += '</tr>';
            code += '<tr class="b">';
            code += '<td>BPM</td>';
            code += '<td>' + gymTriningsJSON.spinningtrainings[0].bpm + '</td>';
            code += '</tr>';
            code += '</table>';


            $("[id=gymTrainingContent" + id + "]").html(code).show(400);
            $('[id=tableRunTraining]').css("border-collapse", "collapse").css("border-color", "#9828c6").css("margin-bottom", "10px");
        }
    });
}


function printCard(idCard, day){
    $.ajax("./manageGymTraining.php", {
        data: {
            req: "printCard",
            idCard: idCard,
            day: day
        },
        type: "POST"
    }).done(function(msg) {
        alert(msg);
        //exerxisesJSON = JSON.parse(msg);
        //alert(userJSON.result);
       
    });
}


function closeTraining(activityId, id, type) {
    $("[id=gymTrainingContent" + id + "]").html('');
}

function loadBBCard() {
    var valueCardElement = $('[id=bb_card_value]').val();

    if (valueCardElement === "null") {
        $('[id=select_number_of_day]').hide(100);
        clearGymTableExsercise();
        return;
    }

    $idBBCard = valueCardElement.split(";")[2];
    $numberOfDay = valueCardElement.split(";")[1];
    $currentDay = 1;



    if ($numberOfDay <= 0) {
        alert("THIS BB CARD IS NOT CONFIGURATED!!!");
        $('[id=select_number_of_day]').hide(100);
        return;
    }
    /*create an option code*/
    var code = '';

    for (var $i = 0; $i < Number($numberOfDay); $i++) {
        code += '<option>' + ($i + 1) + '</option>';
    }

    $('[id=select_BB_card_day]').html(code);

    $('[id=select_number_of_day]').show(100);

    loadExerciseBBCArdFromServer($idBBCard, $currentDay);
}

function loadExerciseBBCArdFromServer($idBBCard, $dayBBCArd) {
    $.ajax("./manageGymTraining.php", {
        data: {
            req: "loadExerciseBBCard",
            idBBCard: $idBBCard,
            dayBBCard: $dayBBCArd
        },
        type: "POST"
    }).done(function(msg) {
        //alert(msg);
        exerxisesJSON = JSON.parse(msg);
        //alert(userJSON.result);
        setGymExerciseToTable(exerxisesJSON.exercise);
    });

}

/**
 * This method set to excel table the gym exsercises 
 * @param {type} exercises in ana array of exercise
 * @returns {undefined} */
function setGymExerciseToTable(exercises) {
    //alert(exercises[0].name);
    var data2 = [];
    for(var i=0; i<exercises.length; i++){
        tmp2 = exercises[i].serie;
        for(var j=0;j<tmp2; j++){
            data2.push(new Array(exercises[i].name,"",""));
        }
    }
    //alert(data2);

    $("#example").handsontable("loadData", data2);
}


function clearGymTableExsercise(){
    var data = [];
    $("#example").handsontable("loadData", data);
}


function toInsertWorkout() {

    if (STATE !== 'LOGIN') {

        STATE = 'INSERT_WORKOUT';

        /**/
        $("[id=center]").load("./InsertWorkout.php");
    }
}

function toInsertRunningTraining() {

    if (STATE !== 'LOGIN') {

        STATE = 'INSERT_RUNNING_TRAINING';

        /**/
        $("[id=center]").load("./insertRunningTraining.php");
    }
}

function toInsertSpinningTraining() {

    if (STATE !== 'LOGIN') {

        STATE = 'INSERT_SPINNING_TRAINING';

        /**/
        $("[id=center]").load("./InsertSpinningTraining.php");
    }
}


function toHOME() {

    if (STATE !== 'LOGIN') {

        STATE = 'HOME';

        /**/
        $("[id=center]").load("./menuPage.php");
    }
}


var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    //var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    var mapOptions = {
        zoom: 7
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);
}

function calcRoute() {
    var start = 'san pietro in guarano';//= document.getElementById('start').value;
    var end = 'spezzano sila';//document.getElementById('end').value;
    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService = new google.maps.DirectionsService();
    directionsService.route(request, function(response, status) {
        if (status === google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}
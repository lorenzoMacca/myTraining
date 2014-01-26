/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var STATE = 'LOGIN';


function doLogin(username, password) {
    //alert(password);
    $.ajax("doLogin.php", {
        data: {
            req: "login",
            username: username,
            password: password
        },
        type: "GET"
    }).done(function(msg) {
        //alert(msg);
        userJSON = JSON.parse(msg);

        if (userJSON.connect === 'OK') {
            $("[id=center]").load("./menuPage.php");
            STATE = 'HOME';
        } else {
            $("[id=center]").append("<div>ERROR IN LOGIN, CHECK USERNAME OR PASSWORD</div>");
        }
    });
}

function sendRunningTrainingdataToServer( dataGym, hour, duration, shoes, path, bpm, time, weather){
    //alert(''+dataGym+' '+hour+' '+duration+' '+path+' '+shoes+' '+bpm+' '+time);
    
     //validate data input before to send
    var dataExpression = /[0-9][0-9][/][0-9][0-9][/][0-9][0-9][0-9][0-9]/;
    if(!dataExpression.test(dataGym)){
        alert('check the data!!!');
        return;
    }

    //validate hour input before to send 
    var expression = /[0-2][0-9]:[0-5][0-9]/;
    if(!expression.test(hour)){
        alert('check the hour!!!');
        return;
    }
    
    $.ajax("./manageRunningTraining.php", {
        data: {
            req: "sendRunningTrainingData",
            dataGym:dataGym,
            hour:hour,
            duration:duration,
            shoes:shoes,
            path:path,
            bpm:bpm,
            time:time,
            weather:weather
        },
        type: "POST"
    }).done(function(msg) {
        //alert(msg);
        userJSON = JSON.parse(msg);
        alert(userJSON.result);
        toHOME();
    });
}

function sendGymTrainingDataToServer(gymtrainingData, dataGym, hour, duration, weight){
    
    //validate data input before to send
    var dataExpression = /[0-9][0-9][/][0-9][0-9][/][0-9][0-9][0-9][0-9]/;
    if(!dataExpression.test(dataGym)){
        alert('check the data!!!');
        return;
    }

    //validate hour input before to send 
    var expression = /[0-2][0-9]:[0-5][0-9]/;
    if(!expression.test(hour)){
        alert('check the hour!!!');
        return;
    }

     $.ajax("./manageGymTraining.php", {
        data: {
            req: "sendGymTrainingData",
            gymtrainingData: gymtrainingData,
            dataGym:dataGym,
            hour:hour,
            duration:duration,
            weight:weight
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

            $("[id=gymTrainingContent" + id + "]").html(code).show(400);
            $('[id=tableRunTraining]').css("border-collapse", "collapse").css("border-color", "#9828c6").css("margin-bottom", "10px");
        }
    });
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
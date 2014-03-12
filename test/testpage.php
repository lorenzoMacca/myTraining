<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        include '../PrintData/PrintData.php';
        
        $header = array('A','B','C');
        $data = array(array('A','V'),array('X','S'));
        PrintData::createCSVFile("a1234.txt", $header, $data);
        ?>
    </body>
</html>

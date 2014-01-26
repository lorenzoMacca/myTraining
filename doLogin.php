<?php
    
    include './DataBaseConnection.php';
    include './InitSession.php';

    /*
     * get parameter to login. 
     */
    $password = $_GET["password"];
    $username = $_GET["username"];
    
    /*
     * get connection from static class DataBaseConnection
     */
    DataBaseConnection::getDBConnectionInstance();
    
    /*
     * check username and password to db
     */
    
    $query = "select id,email from user where username = '$username' and password = '$password';";
    $result = mysql_query($query);
    if (!$result) {
         die('Invalid query: ' . mysql_error());
    }
    
    $id = NULL;
    while($row=mysql_fetch_row($result)){
        $id = $row[0];
        $email = $row[1];
        session_start();
        $_SESSION[InitSession::LOGIN] = 1;
        $_SESSION[InitSession::USERNAME] = $username;
        $_SESSION[InitSession::USER_ID] = $id;
        $_SESSION[InitSession::USER_EMAIL] = $email; 
        session_write_close();    
        $json_res = '{"username":"' . $username . '", "connect":"OK"}' ;
        echo $json_res;
     }

     if($id == NULL){
         $json_res = '{"connect":"FALSE"}' ;
         echo $json_res;
     }
    
    
    

?>

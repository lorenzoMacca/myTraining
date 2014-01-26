<?php
include './LogManage/LogMyTraining.php';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InitSession
 *
 * @author lorenzo
 */
class InitSession {
    //put your code here
    
    const LOGIN = 'doLogin';
    const USERNAME = 'username';
    const USER_ID = 'user_id';
    const USER_EMAIL = 'user_email';
    const TRAINING_NUM = 'training_num';
    function __construct() {
        LogMyTraining::Log("-1", "system", "construct initSession");
    }


    public function init(){
        session_start();
        $_SESSION[InitSession::LOGIN] = 0;
        $_SESSION[InitSession::USERNAME] = '';
        $_SESSION[InitSession::USER_ID] = -1;
        $_SESSION[InitSession::USER_EMAIL] = '';
        $_SESSION[InitSession::TRAINING_NUM] = '100';
        LogMyTraining::Log("-1", "system", "initialize session variable to initialvalue");
        session_write_close();
    }
    
}

?>

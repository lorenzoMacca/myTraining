<?php

require_once "Mail.php";

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SendMail
 *
 * @author lorenzo
 */
class SendMail{

    //put your code here

    private static $from = "lorenzo cozza <lorenzo.cozza@hotmail.com>";
    private static $host = "smtp.live.com";
    private static $username = "lorenzo.cozza@hotmail.com";
    private static $password = "00260191";  //<--- in chiaro ?

    /**
     * This static function send an email to the user
     * 
     * @param type $to emal to user
     * @param type $subject subject 
     * @param type $body email text
     */
    public static function sendGymTrainingEmail($to, $subject, $body) {
        $headers = array('From' => SendMail::$from,
            'To' => $to,
            'Subject' => $subject);
        $smtp = Mail::factory('smtp', array('host' => SendMail::$host,
                    'auth' => true,
                    'username' => SendMail::$username,
                    'password' => SendMail::$password));

        $mail = $smtp->send($to, $headers, $body);

        if (PEAR::isError($mail)) {
            //echo("<p>" . $mail->getMessage() . "</p>");
        } else {
            //echo("<p>Message successfully sent!</p>");
        }
    }

}

?>

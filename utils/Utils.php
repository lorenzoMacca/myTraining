<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Utils
 *
 * @author lorenzo
 */
class Utils {
    //put your code here
    
    static private $month = ['JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER'];
    
    public static function getMonthFromNum($date){
        /*MANCANO I CONTROLLI*/
        list($year, $month, $day) = explode('-', $date);
        
        return Utils::$month[number_format($month)-1];
    }
}

?>

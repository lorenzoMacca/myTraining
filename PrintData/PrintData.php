<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PrintData
 *
 * @author lorenzo
 */
class PrintData {
    //put your code here

    /**
     * 
     * @param type $header an array 
     * @param type $data a matrix
     */
    public static function createCSVFile($fileName, $header, $data) {
        $handle = fopen("tmp/".$fileName, "w");
        fwrite($handle, "Testo che vuoi scrivere nel file di testo...");
        fclose($handle);
    }

}

?>

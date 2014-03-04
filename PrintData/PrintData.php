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
        $handle = fopen("../tmp_file_download/".$fileName, "w");
        $codeCSV = '';
        for($i=0; $i<count($header); $i++){
            $codeCSV = $codeCSV.$header[$i].';';
        }
        $codeCSV .= "\n";
        for($i=0; $i<count($data); $i++){
            for($j=0; $J<count($data[$i]); $j++){
                $codeCSV = $codeCSV.$data."\n";
             }   
                $codeCSV = $codeCSV.$data."\n";
        }
        fwrite($handle, $codeCSV);
        fclose($handle);
    }

}

?>

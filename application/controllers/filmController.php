<?php

class filmController extends framework {


    public function __construct(){
    }

    public function index($filmID){
        // $this->view("home");
    }

    public function detail(){
        $this -> view("detail", $filmID);
    }

    public function download($file){
        $filepath = ROOT . DS . "resource".DS. $file .".mp4";
    echo $filepath;
        // Process download
        if(file_exists($filepath)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($filepath).'"');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($filepath));
            flush(); // Flush system output buffer
            readfile($filepath);
            exit;
        }
    }
}


?>
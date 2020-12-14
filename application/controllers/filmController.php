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
}


?>
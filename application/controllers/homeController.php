<?php

class homeController extends framework {


    public function __construct(){
        $this->filmModel = $this->model('filmModel');

    }

    public function index(){
        $data = [
            'phim-chieu-rap-moi'=> $this->filmModel->filmNew(1),
            'phim-le-moi'=> $this->filmModel->filmNew(2),
            'phim-bo-moi'=> $this->filmModel->filmNew(3),
        ];

        $this->view("home", $data);
    }
}


?>
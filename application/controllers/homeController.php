<?php

class homeController extends framework {


    public function __construct(){
        $this->filmModel = $this->model('filmModel');

    }

    public function index(){
        $data = [
            'phim-chieu-rap-moi'=> $this->filmModel->filmNew(1),
            'phim-le-moi'=> $this->filmModel->filmNew(1),
            'phim-bo-moi'=> $this->filmModel->filmNew(1),
            'phim-hoat-hinh-moi'=> $this->filmModel->filmNew(1),
        ];

        $this->view("home", $data);
    }
}


?>
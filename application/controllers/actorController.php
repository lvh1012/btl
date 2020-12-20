<?php
class actorController extends framework
{
    public function __construct()
    {
        $this->actorModel = $this->model('actorModel');
    }

    public function index($filmID)
    {
        $this->view("not-found");
    }

    public function detail($actorID = null)
    {
        if (isset($actorID) && !empty($actorID)) {
            $data = [
                'info' => $this->actorModel->getInfo($actorID),
                'film' => $this->actorModel->getFilmActor($actorID)
            ];
            $this->view("actor", $data);
        }
        else{
            $this->view("not-found");
        }
    }
}

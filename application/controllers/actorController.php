<?php
class actorController extends framework
{
    public function detail($actorID = null)
    {
        $data = [
            'info' => [],
            'film' => []
        ];
        $this->view("actor", $data);
    }
}

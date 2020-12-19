<?php

class filmController extends framework
{


    public function __construct()
    {
        $this->filmModel = $this->model('filmModel');
    }

    public function index($filmID)
    {
        // $this->view("home");
    }

    public function detail($filmID = null)
    {
        $data = [ 
            'data' =>$this->filmModel->getDetail($filmID),
            'comment' => $this->filmModel->getComment($filmID),
            'favorite' => false
        ];
        if ($this->getSession('userId')){
            $data['favorite'] = $this->filmModel->isFavorite($this->getSession('userId'), $filmID);
        }
        $this->view("detail", $data);
    }

    public function watch($filmID = null)
    {
        // them phim vao danh sach xem gan nhat
        $watchLatest = $this->getNoti("watchLatest");
        if (isset($watchLatest)) {
            $list = explode("|", $watchLatest);
            if (!in_array($filmID, $list)) {
                if (count($list) == 4) {
                    array_shift($list);
                }
                array_push($list, $filmID);
                $this->setNoti("watchLatest", join("|", $list));
            }
        } else {
            $this->setNoti("watchLatest", $filmID);
        }

        // tang view len 1 don vi
        $this->filmModel->increView($filmID);

        $data = [ 
            'data' =>$this->filmModel->getDetail($filmID),
            'comment' => $this->filmModel->getComment($filmID)
        ];
        $this->view("watch", $data);
    }

    public function download($file)
    {
        $filepath = ROOT . DS . "resource" . DS . $file . ".mp4";
        echo $filepath;
        // Process download
        if (file_exists($filepath)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="' . basename($filepath) . '"');
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

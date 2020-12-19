<?php

class apiController extends framework
{
    public function addFavorite()
    {
        if ($_SESSION['userId']) {
            $data = json_decode(file_get_contents('php://input'), true);
            $data['user_id'] = $_SESSION['userId'];
            $user = new userModel;
            $user->addFavorite($data);
            $rp = ['status' => 'ok'];
            $this->response(200, $rp);
        } else {
            $rp = ['status' => 'error'];
            $this->response(200, $rp);
        }
    }

    public function comment()
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $data['user_id'] = $_SESSION['userId'];
        $cmt = new commentModel;
        if ($cmt->addComment($data)){
            $this->response(200);
        }
    }

    public function response($status_code, $data = NULL)
    {
        header($this->http_header($status_code));
        header("Content-Type: application/json");
        echo json_encode($data);
    }

    public function http_header($status_code)
    {
        $status = array(
            100 => 'Continue',
            101 => 'Switching Protocols',
            200 => 'OK',
            201 => 'Created',
            202 => 'Accepted',
            203 => 'Non-Authoritative Information',
            204 => 'No Content',
            205 => 'Reset Content',
            206 => 'Partial Content',
            300 => 'Multiple Choices',
            301 => 'Moved Permanently',
            302 => 'Found',
            303 => 'See Other',
            304 => 'Not Modified',
            305 => 'Use Proxy',
            306 => '(Unused)',
            307 => 'Temporary Redirect',
            400 => 'Bad Request',
            401 => 'Unauthorized',
            402 => 'Payment Required',
            403 => 'Forbidden',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            406 => 'Not Acceptable',
            407 => 'Proxy Authentication Required',
            408 => 'Request Timeout',
            409 => 'Conflict',
            410 => 'Gone',
            411 => 'Length Required',
            412 => 'Precondition Failed',
            413 => 'Request Entity Too Large',
            414 => 'Request-URI Too Long',
            415 => 'Unsupported Media Type',
            416 => 'Requested Range Not Satisfiable',
            417 => 'Expectation Failed',
            500 => 'Internal Server Error',
            501 => 'Not Implemented',
            502 => 'Bad Gateway',
            503 => 'Service Unavailable',
            504 => 'Gateway Timeout',
            505 => 'HTTP Version Not Supported'
        );
        return "HTTP/1.1 " . $status_code . " " . $status[$status_code];
    }
}

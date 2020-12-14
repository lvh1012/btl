<?php

class route {
   
    // Default contorller, method, params

    public $controller = "home";
    public $method     = "index";
    public $params     = [];

    public function __construct()
    {
        // lấy url
        $url = $this->url();

        // lay controller
        if(!empty($url)){
            $this->controller = $url[0] . "Controller";
            unset($url[0]);
        }
        else{
            $this->controller = $this->controller . "Controller";
        }
        
        // Instantiate controller
        $this->controller = new $this->controller;

        // lay action
        if(isset($url[1]) && !empty($url[1])){
            $this->method = $url[1];
            unset($url[1]);
        }


        // lay tham so
        if(isset($url)){
            $this->params = $url;
        } else {
            $this->params = [];
        }
        call_user_func_array(array($this->controller, $this->method), $this->params);
    }

    public function url(){
        if(isset($_GET['url'])){
            $url = $_GET['url'];
            $url = rtrim($url);
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode("/", $url);
            return $url;
        }
    }

}

?>
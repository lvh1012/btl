<?php
error_reporting(0);
class framework
{
    // tra ve view
    public function view($viewName, $data = [])
    {
        if (file_exists(".." . DS . "application" . DS . "views" . DS . $viewName . ".php")) {
            require_once ".." . DS . "application" . DS . "views" . DS . $viewName . ".php";
        } else {
            require_once ".." . DS . "application" . DS . "views" . DS . "not-found.php";
        }
    }

    public function model($modelName)
    {
        return new $modelName;
    }

    // validate gia tri dau vao
    public function input($inputName)
    {
        if ($_SERVER['REQUEST_METHOD'] == "POST" || $_SERVER['REQUEST_METHOD'] == 'post') {
            return trim(strip_tags($_POST[$inputName]));
        } else if ($_SERVER['REQUEST_METHOD'] == 'GET' || $_SERVER['REQUEST_METHOD'] == 'get') {
            return trim(strip_tags($_GET[$inputName]));
        }
    }

    // Set session
    public function setSession($sessionName, $sessionValue)
    {

        if (!empty($sessionName) && !empty($sessionValue)) {
            $_SESSION[$sessionName] = $sessionValue;
        }
    }

    // Get session
    public function getSession($sessionName)
    {

        if (!empty($sessionName)) {
            return $_SESSION[$sessionName];
        }
    }

    // Unset session
    public function unsetSession($sessionName)
    {

        if (!empty($sessionName)) {

            unset($_SESSION[$sessionName]);
        }
    }

    // Destroy whole sessions
    public function destroy()
    {

        session_destroy();
    }


    // Set flash message
    public function setNoti($sessionName, $msg)
    {
        if (!empty($sessionName) && !empty($msg)) {

            $_SESSION[$sessionName] = $msg;
        }
    }

    //Show flash message
    public function getNoti($sessionName, $className)
    {

        if (!empty($sessionName) && !empty($className) && isset($_SESSION[$sessionName])) {

            $msg = $_SESSION[$sessionName];

            echo "<div class='" . $className . "'>" . $msg . "</div>";
            unset($_SESSION[$sessionName]);
        }
    }

    public function redirect($path)
    {
        header("location:" . BASEURL . "/" . $path);
    }
}

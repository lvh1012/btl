<?php

class userController extends framework
{
    public function __construct()
    {
        // if($this->getSession('userId')){
        //     $this->redirect("profile");
        // }
        $this->userModel = $this->model('userModel');
    }

    public function index()
    {
        $this->view("home");
    }

    public function login()
    {
        if ($_SERVER["REQUEST_METHOD"] != "POST") {
            $this->view("login");
        } else {
            $this->userLogin();
        }
    }

    public function register()
    {
        if ($_SERVER["REQUEST_METHOD"] != "POST") {
            $this->view("register");
        } else {
            $this->createAccount();
        }
    }

    public function userLogin()
    {
        $userData = [

            'email'         => $this->input('email'),
            'password'      => $this->input('password'),
            'emailError'    => '',
            'passwordError' => ''

        ];

        if (empty($userData['email'])) {
            $userData['emailError'] = "Email is required";
        } else if (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $userData['email'])) {
            $userData['emailError'] = "Email is Invalid";
        }

        if (empty($userData['password'])) {
            $userData['passwordError'] = "Password is required";
        } else if (strlen($userData['password']) < 6) {
            $userData['passwordError'] = "Password must be 6 characters long";
        }

        if (empty($userData['emailError']) && empty($userData['passwordError'])) {
            $result = $this->userModel->userLogin($userData['email'], $userData['password']);
            if ($result['status'] === 'emailNotFound') {
                $userData['emailError'] = "Sorry invalid email";
                $this->view("login", $userData);
            } else if ($result['status'] === 'passwordNotMacthed') {
                $userData['passwordError'] = "Sorry invalid password";
                $this->view("login", $userData);
            } else if ($result['status'] === "ok") {
                $this->setSession("userId", $result['user_id']);
                $this->setSession("username", $result['name']);
                $this->redirect("home");
            }
        } else {
            $this->view("login", $userData);
        }
    }

    public function createAccount()
    {
        $userData = [
            'fullname'        => $this->input('fullname'),
            'email'           => $this->input('email'),
            'password'        => $this->input('password'),
            'gender'          => $this->input('gender'),
            'fullnameError'   => '',
            'emailError'      => '',
            'passwordError'   => '',
            'genderError'     => '',
        ];

        if (empty($userData['fullname'])) {
            $userData['fullnameError'] = 'Full Name is required';
        }

        if (empty($userData['gender'])) {
            $userData['genderError'] = 'Gender is required';
        }

        if (empty($userData['email'])) {
            $userData['emailError'] = "Email is required";
        } else if (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $userData['email'])) {
            $userData['emailError'] = "Email is Invalid";
        } else {
            if (!$this->userModel->checkEmail($userData['email'])) {

                $userData['emailError'] = "Sorry this email is already exist";
            }
        }

        if (empty($userData['password'])) {
            $userData['passwordError'] = "Password is required";
        } else if (strlen($userData['password']) < 6) {
            $userData['passwordError'] = "Password must be 6 characters long";
        }

        if (
            empty($userData['fullnameError']) && empty($userData['emailError'])
            && empty($userData['passwordError']) && empty($userData['genderError'])
        ) {

            $password = password_hash($userData['password'], PASSWORD_DEFAULT);
            $data = [$userData['fullname'], $userData['email'], $userData['gender'], $password];

            if ($this->userModel->createAccount($data)) {

                $this->setNoti("accountCreated", "Your account has been created successfully");
                $this->redirect("user/login");
            }
        } else {
            $this->view('register', $userData);
        }
    }
}

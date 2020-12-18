<?php

class userModel extends database {
    public function checkEmail($email){
        if($this->Query("SELECT email FROM user WHERE email = ?", [$email])){

            if($this->rowCount() > 0 ){
                return false;
            } else {
                return true;
            }

        }

    }

    public function createAccount($data){

        if($this->Query("INSERT INTO user (name, email, gender, password) VALUES (?,?,?,?)", $data)){
            return true;
        }
    }

    public function userLogin($email, $password){

        if($this->Query("SELECT * FROM user WHERE email = ? ", [$email])){
            if($this->rowCount() > 0 ){
                $row = $this->fetch();
                $dbPassword = $row->password;
                $userId = $row->user_id;
                $name = $row->name;
                if(password_verify($password, $dbPassword)){
                    return ['status' => 'ok', 'user_id' => $userId, 'name' => $name];
                } else {
                    return ['status' => 'passwordNotMacthed'];
                }

            } else {
                return ['status' => 'emailNotFound'];
            }

        }


    }

}


?>
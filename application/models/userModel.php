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

    public function addFavorite($data){
        if (!strcmp($data['action'],"remove")){
            $this->Query('DELETE FROM favorite WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
        }
        else{
            $this->Query('INSERT INTO favorite VALUES (?,?)', [$data['user_id'], $data['id']]);
        }
    }

    public function createAccount($data){

        if($this->Query("INSERT INTO user (name, email, gender, password) VALUES (?,?,?,?)", $data)){
            return true;
        }
    }

    public function getFavoriteFilm ($userId) {
        $this->Query('SELECT * FROM favorite, film WHERE favorite.film_id = film.film_id and favorite.user_id = ?', [$userId]);
        return $this->fetchall();
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
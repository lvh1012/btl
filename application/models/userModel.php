<?php

class userModel extends database
{
    public function checkEmail($email)
    {
        if ($this->Query("SELECT email FROM user WHERE email = ?", [$email])) {

            if ($this->rowCount() > 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    public function addFavorite($data)
    {
        if (!strcmp($data['action'], "remove")) {
            $this->Query('DELETE FROM favorite WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
        } else {
            $this->Query('INSERT INTO favorite VALUES (?,?)', [$data['user_id'], $data['id']]);
        }
    }

    public function like($data)
    {
        if (!strcmp($data['action'], "remove")) {
            $this->Query('DELETE FROM like_film WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
            $this->Query('update film set num_like = num_like -1 where film_id = ?', [$data['id']]);
        } else {
            $this->Query('select * from dislike_film where user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
            if ($this->rowCount() > 0) {
                $this->Query('DELETE FROM dislike_film WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
                $this->Query('update film set num_dislike = num_dislike -1 where film_id = ?', [$data['id']]);
            }
            $this->Query('INSERT INTO like_film VALUES (?,?)', [$data['user_id'], $data['id']]);
            $this->Query('update film set num_like = num_like + 1 where film_id = ?', [$data['id']]);
        }
    }

    public function dislike($data)
    {
        if (!strcmp($data['action'], "remove")) {
            $this->Query('DELETE FROM dislike_film WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
            $this->Query('update film set num_dislike = num_dislike -1 where film_id = ?', [$data['id']]);
        } else {
            $this->Query('select * from like_film where user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
            if ($this->rowCount() > 0) {
                $this->Query('DELETE FROM like_film WHERE user_id = ? and film_id  = ?', [$data['user_id'], $data['id']]);
                $this->Query('update film set num_like = num_like -1 where film_id = ?', [$data['id']]);
            }
            $this->Query('INSERT INTO dislike_film VALUES (?,?)', [$data['user_id'], $data['id']]);
            $this->Query('update film set num_dislike = num_dislike + 1 where film_id = ?', [$data['id']]);
        }
    }

    public function createAccount($data)
    {

        if ($this->Query("INSERT INTO user (name, email, gender, password) VALUES (?,?,?,?)", $data)) {
            return true;
        }
    }

    public function getFavoriteFilm($userId)
    {
        $this->Query('SELECT * FROM favorite, film WHERE favorite.film_id = film.film_id and favorite.user_id = ?', [$userId]);
        return $this->fetchall();
    }

    public function getLikeFilm($userId)
    {
        $this->Query('SELECT * FROM like_film, film WHERE like_film.film_id = film.film_id and like_film.user_id = ?', [$userId]);
        return $this->fetchall();
    }

    public function userLogin($email, $password)
    {

        if ($this->Query("SELECT * FROM user WHERE email = ? ", [$email])) {
            if ($this->rowCount() > 0) {
                $row = $this->fetch();
                $dbPassword = $row->password;
                $userId = $row->user_id;
                $name = $row->name;
                if (password_verify($password, $dbPassword)) {
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

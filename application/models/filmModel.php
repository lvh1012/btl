<?php

class filmModel extends database {
    public function FilmNew($type){
        // lay ra 8 ban ghi sap xep theo thu tu giam dan cua id
        $this->Query('SELECT * FROM film, film_type where film.film_id = film_type.film_id and film_type.type_id = ? order by film.film_id DESC LIMIT 8', [$type]);
        return $this->fetchall();
    }

    public function getFilmByID($filmID){
        $this->Query('SELECT resource FROM film where film_id =  ?', [$filmID]);
        return $this->fetch();
    }

    public function searchByKeyword($keyword){
        if(!empty($keyword)){
            $keyword = strtolower($keyword);
            $this->Query('SELECT * FROM film WHERE LOWER(name_en) like ? or LOWER(name_vi) like ?', ['%'.$keyword.'%','%'.$keyword.'%']);
            return $this->fetchall();
        }
        else{
            $this->Query('SELECT * FROM film');
            return $this->fetchall();
        }
    }

    public function getFilm($type){
        $this->Query('SELECT * FROM film, film_type where film.film_id = film_type.film_id and film_type.type_id = ? order by film.film_id DESC', [$type]);
        return $this->fetchall();
    }

    public function increView($ID){
        $this->Query('update film set num_view = num_view + 1 where film_id = ?', [$ID]);
    }

    public function getDetail($ID){
        $this->Query('SELECT * FROM film where film_id =  ?', [$ID]);
        return $this->fetch();
    }

    public function getComment($ID){
        $this->Query('SELECT * FROM comment, user WHERE user.user_id = comment.user_id and film_id=  ? order by time DESC', [$ID]);
        return $this->fetchall();
    }

    public function isFavorite($user_id, $film_id){
        $this->Query('SELECT * FROM favorite where user_id =  ? and film_id = ?', [$user_id, $film_id]);
        if($this->rowCount() > 0 ){
            return true;
        } else {
            return false;
        }
    }

}


?>
<?php

class filmModel extends database {
    public function FilmNew($type){
        // lay ra 8 ban ghi sap xep theo thu tu giam dan cua id
        $this->Query('SELECT * FROM film, film_type where film.film_id = film_type.film_id and film_type.type_id = ? order by film.film_id DESC LIMIT 8', [$type]);
        return $this->fetchall();
    }

    public function getDetail($ID){
        $this->Query('SELECT * FROM film where film_id =  ?', [$ID]);
        return $this->fetch();
    }

}


?>
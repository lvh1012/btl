<?php
class actorModel extends database
{
    public function getInfo($ID)
    {
        $this->Query('SELECT * FROM person, nation where person_id =  ? and nation.nation_id = person.nation_id', [$ID]);
        return $this->fetch();
    }

    public function getFilmActor($ID)
    {
        $this->Query('SELECT * FROM film_person, film where film_person.film_id =  film.film_id and film_person.person_id = ?', [$ID]);
        return $this->fetchall();
    }
}

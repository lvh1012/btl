<?php

class commentModel extends database {
    public function addComment($data){
        if($this->Query('insert into comment (content, user_id, film_id) values (?,?,?)', [$data['comment'],$data['user_id'],$data['film_id']]))
            return true;
        else return false;
    }

}

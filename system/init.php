<?php

// tự động thêm class
spl_autoload_register(function($className){

  if (file_exists(ROOT . DS . 'system' . DS . 'library' . DS. $className.'.php'))
    require_once(ROOT . DS . 'system' . DS . 'library' . DS. $className.'.php');
  elseif (file_exists(ROOT . DS . 'application' . DS . 'controllers' . DS. $className.'.php'))
    require_once(ROOT . DS . 'application' . DS . 'controllers' . DS. $className.'.php');
  elseif (file_exists(ROOT . DS . 'application' . DS . 'models' . DS. $className.'.php'))
    require_once(ROOT . DS . 'application' . DS . 'models' . DS. $className.'.php');
  elseif (file_exists(ROOT . DS . 'application' . DS . 'views' . DS. $className.'.php'))
    require_once(ROOT . DS . 'application' . DS . 'views' . DS. $className.'.php');
});

$route = new Route;


?>
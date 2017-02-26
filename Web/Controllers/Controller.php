<?php

namespace Web\Controllers;

use Silex\Application;
use ReflectionObject;
use ReflectionProperty;
use \Utilities\ObjectConverter;

//twig -> Model.XXX
class Controller {

  protected function render(Application $app, $object = null) {
    $method = debug_backtrace()[1]['function'];
    $className = $this->getClassName($this);
    $data  = ObjectConverter::anyToArray(array("Model" => $object));
    return $app['twig']->render($className."/".$method.".html.twig", $data);
  }

  private function getClassName($object) {
    $strClass = explode("\\", get_class($object));
    $strClass = $strClass[count($strClass) - 1];
    return $strClass;
  }

  protected function redirectBind($app, $str) {
    return $app->redirect($this->urlBind($app, $str));
  }

  protected function urlBind($app, $str) {
    return $app["url_generator"]->generate($str);
  }
}

?>
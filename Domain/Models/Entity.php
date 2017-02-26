<?php

namespace Domain\Models;

use ReflectionObject;

class Entity {

  public function get($property) {
    $rc_this = new ReflectionObject($this);
    $method = "get".$property;
    if ($rc_this->hasMethod($method)) {
      return $this->$method();
    }
    if ($rc_this->hasProperty($property)) {
      return $this->$property;
    }
    return null;
  }

  public function set($property, $value) {
    $rc_this = new ReflectionObject($this);
    $method = "set".$property;
    if ($rc_this->hasMethod($method)) {
      return $this->$method($value);
    }
    if ($rc_this->hasProperty($property)) {
      return $this->$property = $value;
    }
    return null;
  }
}

?>
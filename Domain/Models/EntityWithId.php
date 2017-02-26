<?php

namespace Domain\Models;

class EntityWithId extends Entity {
  protected $Id;

  public function __construct() {
    $this->Id = uniqid();
  }
}

?>
<?php

namespace Web\Models;

use \Domain\Models\Entity;

class MenuItemModel extends Entity {
  protected $url;
  protected $text;
  protected $img;

  public function __construct($url, $text, $img) {
    $this->url = $url;
    $this->text = $text;
    $this->img = $img;
  }
}

?>
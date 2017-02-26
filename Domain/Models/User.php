<?php

namespace Domain\Models;

class User extends EntityWithId {
  protected $Pseudo;
  protected $Email;
  protected $Password;
  protected $StatusId;

  protected function setPassword($str) {
    $this->Password = sha1($str);
  }

  public function isPassword($str) {
    return $this->Password == sha1($str);
  }

}

?>
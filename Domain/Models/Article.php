<?php

namespace Domain\Models;

class Article extends EntityWithId {

  const SUMMARY_SIZE = 800;

  protected $Content;
  protected $Author;
  protected $Title;
  protected $UserId;
  protected $LastModified;
  protected $CategoryId;
  protected $StateId;
  protected $Tags;
  protected $Vues;

  public function __construct() {
    parent::__construct();
    $this->setLastModified();
  }

  protected function setLastModified() {
    $this->LastModified = date("d/m/Y H:i");
  }

  public function addTag($newText) {
    if (!empty($newText)) {
      $this->Tags .= $newText.";";
    }
  }

  public function isOwner($userId) {
    return $this->UserId != null && $this->UserId == $userId;
  }

  public function isValidContent($content = null) {
    if ($content == null) {
      $content = $this->Content;
    }
    $preg = "/.*<script.*>|.*<link.*>|.*<iframe.*>/";
    return !preg_match($preg, $content);
  }

  public function getSummary() {
    return substr($this->Content, 0, self::SUMMARY_SIZE);
  }

  public function setContentWithSummary() {
    //$this->Content = $this->getSummary()."...";
  }

  public function addOneVue() {
    $this->Vues = $this->Vues + 1;
  }

}

?>

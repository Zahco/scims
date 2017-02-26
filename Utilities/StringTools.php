<?php

namespace Utilities;

class StringTools {

  public static function getPlural($str) {
    if ($str[strlen($str) - 1] == 's') {
      return $str;
    } else if ($str[strlen($str) - 1] == 'y') {
      return substr($str, 0, -1)."ies";
    } else {
      return $str.'s';
    }
  }
}

?>
<?php
namespace Utilities;

class Converter {

  public static function latexToMathml($latex) {
    $dir =__DIR__."/../Lib/";
    $cmd = "echo \"$latex\" | ".$dir."calc";
    $ret = shell_exec($cmd);
    return $ret;
  }

}

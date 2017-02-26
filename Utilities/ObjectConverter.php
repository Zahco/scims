<?php
namespace Utilities;

use ReflectionObject;
use ReflectionProperty;

class ObjectConverter {

  public static function objectToArray($object) {
    $reflect = new ReflectionObject($object);
    $properties = $reflect->getProperties(ReflectionProperty::IS_PROTECTED | ReflectionProperty::IS_PUBLIC);
    $data = array();
    foreach ($properties as $prop) {
      $data[$prop->getName()] = $object->get($prop->getName());
    }
    return $data;
  }

  public static function anyToArray($objects) {
    if (is_object($objects)) {
      return ObjectConverter::objectToArray($objects);
    } elseif (is_array($objects)) {
      foreach ($objects as $key => $object) {
        $objects[$key] = ObjectConverter::anyToArray($object);
      }
    } else {
      return $objects;
    }
    return $objects;
  }

}
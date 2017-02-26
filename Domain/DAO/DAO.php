<?php

namespace Domain\DAO;

use Doctrine\DBAL\Connection;
use ReflectionClass;
use ReflectionProperty;
use \Utilities\ObjectConverter;
use \Utilities\StringTools;

class DAO {

  protected $Db;

  public function __construct(Connection $db) {
    $this->Db = $db;
  }

  public function select($Id) {
    $strClass = $this->getClassName($this);
    $tableName = StringTools::getPlural($strClass);
    $strClass = "\\Domain\\Models\\".$strClass;

    $sql = "select * from ".$tableName." where Id=:id";
    $line = $this->Db->fetchAssoc($sql, array("id" => $Id));

    return $this->objectConverter($line);
  }

  public function selectAll() {
    $strClass = $this->getClassName($this);
    $tableName = StringTools::getPlural($strClass);
    $strClass = "\\Domain\\Models\\".$strClass;

    $sql = "select * from ".$tableName." order by Id desc";
    $result = $this->Db->fetchAll($sql);

    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
  }

  public function insert($object) {
    $data = ObjectConverter::objectToArray($object);

    $strClass = $this->getClassName($this);
    $strClass = StringTools::getPlural($strClass);

    return $this->Db->insert($strClass, $data);
  }

  public function update($object) {
    $data = ObjectConverter::objectToArray($object);

    $strClass = $this->getClassName($this);
    $strClass = StringTools::getPlural($strClass);

    return $this->Db->update($strClass, $data, array('Id' => $object->get("Id")));
  }

  public function delete($object) {
    $strClass = $this->getClassName($this);
    $strClass = StringTools::getPlural($strClass);

    return $this->Db->delete($strClass, array('Id' => $object->get("Id")));
  }

  private function getClassName($object) {
    $strClass = explode("\\", get_class($object));
    $strClass = $strClass[count($strClass) - 1];
    $strClass = explode("DAO", $strClass)[0];
    return $strClass;
  }


  protected function objectConverter($sqlResponse) {
    $strClass = $this->getClassName($this);
    $strClass = "\\Domain\\Models\\".$strClass;
    $object = new $strClass();
    $reflect = new ReflectionClass($object);
    $properties = $reflect->getProperties(ReflectionProperty::IS_PROTECTED);
    foreach ($properties as $prop) {
      $property = $reflect->getProperty($prop->getName());
      $property->setAccessible(true);
      $property->setValue($object, $sqlResponse[$prop->getName()]);
    }
    return $object;
  }
}

?>
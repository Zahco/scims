<?php

namespace Domain\DAO;

use Doctrine\DBAL\Connection;

class StatusDAO extends DAO {
  public function selectByName($name) {
    $sql = "select * from Status where Name=:name";
    $line = $this->Db->fetchAssoc($sql, array("name" => $name));

    return $this->objectConverter($line);
  }
}

?>
<?php

namespace Domain\DAO;

use Doctrine\DBAL\Connection;
use \Domain\Models\State;

class StateDAO extends DAO {
  public function selectByName($name) {
    $sql = "select * from States where Name=:name";
    $line = $this->Db->fetchAssoc($sql, array("name" => $name));

    return $this->objectConverter($line);
  }
}

?>
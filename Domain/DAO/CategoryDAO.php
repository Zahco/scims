<?php

namespace Domain\DAO;

use Doctrine\DBAL\Connection;
use \Domain\Models\Category;

class CategoryDAO extends DAO {

  public function selectAllOrderByPopularity() {
    $sql = "select * from Categories order by (select count(*) from Articles, States where StateId = States.Id and CategoryId = Categories.Id and States.Name = 'Public') desc";
    $result = $this->Db->fetchAll($sql);
    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
  }
}

?>
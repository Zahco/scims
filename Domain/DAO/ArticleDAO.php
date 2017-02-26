<?php

namespace Domain\DAO;
use Doctrine\DBAL\Connection;

class ArticleDAO extends DAO {

  public function selectAll() {
    $sql = "select Articles.* from Articles, States where ";
    $sql .= "StateId = States.Id ";
    $sql .= "and States.name = 'Public' ";
    $sql .= "order by Id desc";
    $result = $this->Db->fetchAll($sql);

    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
  }

  public function getNumberArticle() {
    $sql = "select count(Id) as numberId from Articles";
    $line = $this->Db->fetchAssoc($sql);
    return $line["numberId"];
  }

  public function getNumberArticlePrivate() {
    $sql = "select count(Articles.Id) as numberId from Articles, States where StateId = States.Id and States.name = 'Private' ";
    $line = $this->Db->fetchAssoc($sql);
    return $line["numberId"];
  }

  public function getNumberArticlePublic() {
    $sql = "select count(Articles.Id) as numberId from Articles, States where StateId = States.Id and States.name = 'Public' ";
    $line = $this->Db->fetchAssoc($sql);
    return $line["numberId"];
  }

  public function selectAllByUser($userId) {
    $sql = "select * from Articles where UserId = :userid";
    $result = $this->Db->fetchAll($sql, array('userid' => $userId));
    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
  }

  public function selectAllPublicByUser($userId) {
    $sql = "select Articles.* from Articles, States where UserId = :userid and States.Id = StateId and States.name = 'Public'";
    $result = $this->Db->fetchAll($sql, array('userid' => $userId));
    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
  }

	public function selectByCategory($categoryId) {
    $sql = "select Articles.* from Articles, States where ";
    $sql .= "categoryId=:categoryId ";
    $sql .= "and StateId = States.Id ";
    $sql .= "and States.name = 'Public'";
    $result = $this->Db->fetchAll($sql, array("categoryId" => $categoryId));

    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
	}

	public function selectByRegex($Regex) {
    $sql = "select Articles.* from Articles, Users, States, Categories where ";
    $sql .= "UserId = Users.Id ";
    $sql .= "and CategoryId = Categories.Id ";
    $sql .= "and StateId = States.Id ";
    $sql .= "and States.name = 'Public' ";
    $sql .= "and (Users.Pseudo like :Regex ";
    $sql .= "or Title like :Regex ";
    $sql .= "or Author like :Regex " ;
    $sql .= "or Tags like :Regex ";
    $sql .= "or Categories.Name like :Regex)";

    $result = $this->Db->fetchAll($sql, array("Regex" => "%".$Regex."%"));

    $data = array();
    foreach ($result as $line) {
      $data[$line["Id"]] = $this->objectConverter($line);
    }
    return $data;
	}

  public function selectAllWithPrivate() {
      $sql = "select Articles.* from Articles order by Id desc";
      $result = $this->Db->fetchAll($sql);
      $data = array();
      foreach ($result as $line) {
          $data[$line["Id"]] = $this->objectConverter($line);
      }
      return $data;
  }

  public function selectArticlesBySubscription($userId) {
      $sql = "select * from Articles where UserId = any (select UserId from Followers where FollowerId = :userId)";
      $sql .= "order by LastModified desc";
      $result = $this->Db->fetchAll($sql, array("userId" => $userId));

      $data = array();
      foreach ($result as $line) {
          $data[$line["Id"]] = $this->objectConverter($line);
      }
      return $data;
  }

  public function getAverage() {
      $sql = "SELECT avg(tmp.number) as moy FROM (select count(Id) as number from Articles group by UserId) as tmp; ";
      $result = $this->Db->fetchAssoc($sql);
      return $result["moy"];
  }
}

?>

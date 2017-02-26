<?php

namespace Domain\DAO;

use Doctrine\DBAL\Connection;
use \Domain\Models\User;

class UserDAO extends DAO {
  public function selectByEmail($email) {
    $sql = "select * from Users where Email=:email";
    $line = $this->Db->fetchAssoc($sql, array("email" => $email));

    return $this->objectConverter($line);
  }

  public function getNumberOfSpecificMail($email) {
  	$sql = "select count(*) as numberMail from Users where Email =:email";
		$line = $this->Db->fetchAssoc($sql, array("email" => $email));
		return $line["numberMail"];
  }

  public function getNumberOfUser() {
		$sql = "select count(id) as numberId from Users";
		$line = $this->Db->fetchAssoc($sql);
		return $line["numberId"];
	}

	public function getNumberOfUserArticleLess() {
		$sql = "select count(Users.id) as numberId from Users left join Articles on Users.Id = Articles.UserId
where Articles.UserId IS NULL";
		$line = $this->Db->fetchAssoc($sql);
		return $line["numberId"];	
	}
}

	

?>
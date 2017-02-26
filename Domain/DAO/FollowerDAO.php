<?php

namespace Domain\DAO;
use Doctrine\DBAL\Connection;
use \Domain\Models\Follower;

class FollowerDAO extends DAO {

	/* Retourne tous les articles auquel l'utilisateur est abonné

	  Récupérer les utilisateurs auxquel l'utilisateur est abonné
	  Sélectionner tous les Articles ayant l'un des userId présent dans le select d'avant */

  public function getId($userId, $followerId) {
    $sql  = "select * from Followers where ";
    $sql .= "UserId =:userId ";
    $sql .= "and FollowerId =:followerId";
    $result = $this->Db->fetchAssoc($sql, array('userId' => $userId, 'followerId' => $followerId));
    return $this->objectConverter($result);
  }

  public function selectAllArticlesOfUser($followerId) {
  	$sql = "select * from Articles where UserId = any (select UserId from Followers where :followerid = FollowerId) order by desc LastModified ";
  	$result = $this->Db->fetchAll($sql, array('followerid' => $followerId));
  	$data = array();
  	foreach($result as $line) {
  		$data[$line["Id"]] = $this->objectConverter($line);
  	}
  	return $data;
  }
}

?>

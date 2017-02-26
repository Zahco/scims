<?php
namespace Utilities;

use ReflectionObject;
use ReflectionProperty;
use Silex\Application;

class RoleTools {

  public static function isAdministrateur($userId, Application $app) {
  	if($userId == NULL) {
  		return FALSE;
  	}
    $status = $app["dao.status"]->selectByName("Administrateur");
    $user = $app["dao.user"]->select($userId);
    return $status->get("Id") == $user->get("StatusId");
  }

}

?>
<?php

namespace Web\Controllers;

use \Web\Models\MenuItemModel;
use Silex\Application;
use \Utilities\RoleTools;

class Menu extends Controller {

  public function menu(Application $app) {
    $userid = $app["session"]->get("userId");
    if ($userid != null) {
      $menu = array(new MenuItemModel($this->urlBind($app, "subscription"), "Mes abonnements", "star.png"),
        new MenuItemModel($this->urlBind($app, "articlesByUser"), "Mes articles", "folder.png"),
        new MenuItemModel($this->urlBind($app, "articleCreate"), "Ajouter un article", "addFile.png"),
        new MenuItemModel($this->urlBind($app, "profile"), "Profile", "user.png"));
      if (RoleTools::isAdministrateur($userid, $app)) {
        array_unshift($menu, new MenuItemModel($this->urlBind($app, "getStatistics"), "Statistiques", "graph.png"),
          new MenuItemModel($this->urlBind($app, "manage"), "Administration", "settings.png"));
      }
    } else {
      $menu = array(new MenuItemModel($this->urlBind($app, "articleCreate"), "Ajouter un article", "addFile.png"),
        new MenuItemModel($this->urlBind($app, "signIn"), "Sign In", "user.png"));
    }
    return $this->render($app, $menu);
  }
}
?>

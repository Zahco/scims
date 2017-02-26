<?php

namespace Web\Controllers;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Application;
use \Utilities\RoleTools;

class Administration extends Controller {

  public function manage(Application $app) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$users = $app['dao.user']->selectAll();
  	$articles = $app['dao.article']->selectAllWithPrivate();
  	$categories = $app['dao.category']->selectAllOrderByPopularity();
  	$data = array("users"=>$users, "articles"=>$this->addUserInArticle($app, $articles), "state"=>$this->articleState($app, $articles), "categories"=>$categories);
  	return $this->render($app, $data);
  }

  public function removingUser($userId, Application $app) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$user = $app['dao.user']->select($userId);
    $app['dao.user']->delete($user);
  	return $this->redirectBind($app, "manage");;
  }

  public function removingArticle($articleId, Application $app) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$article = $app['dao.article']->select($articleId);
    $app['dao.article']->delete($article);
  	return $this->redirectBind($app, "manage");;
  }

  public function removingCategory($categoryId, Application $app) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$category = $app['dao.category']->select($categoryId);
    $app['dao.category']->delete($category);
  	return $this->redirectBind($app, "manage");;
  }

  public function addCategory(Application $app) {
 	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	return $this->render($app);
  }

  public function editorCategory($categoryId, Application $app) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$category = $app['dao.category']->select($categoryId);
  	return $this->render($app, $category);
  }

  public function editingCategory(Application $app, Request $request) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$category = $app['dao.category']->select($request->get("Id"));
  	$category->set("Name", $request->get("Name"));
  	$category->set("Color", $request->get("Color"));
  	$app['dao.category']->update($category);
  	return $this->redirectBind($app, "manage");
  }

  public function addingCategory(Application $app, Request $request) {
  	if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  		return $this->redirectBind($app, "signIn");
  	}
  	$category = new \Domain\Models\Category();
  	$category->set("Name", $request->get("Name"));
  	$category->set("Color", $request->get("Color"));
  	$app['dao.category']->insert($category);
  	return $this->redirectBind($app, "manage");
  }

  private function addUserInArticle(Application $app, $articles) {
  	$result = array();
  	foreach($articles as $id => $article) {
  		$user = $app['dao.user']->select($article->get("UserId"));
  		$article->User = $user;
  		$result[$id] = $article;
  	}
  	return $result;
  }

  private function articleState(Application $app, $articles) {
    $result = array();
    foreach($articles as $id => $article) {
      $state = $app['dao.state']->select($article->get("StateId"));
      $article->State = $state;
      $result[$id] = $article;
    }
    return $result;
  }
}
?>

<?php

namespace Web\Controllers;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Silex\Application;
use \Utilities\RoleTools;

class Statistique extends Controller {

	public function getStatistics(Application $app) {
		if (!RoleTools::isAdministrateur($app["session"]->get("userId"), $app)) {
  			return $this->redirectBind($app, "signIn");
  		}
		$nbUsers = $app['dao.user']->getNumberOfUser();
		$nbUsersArticleLess = $app['dao.user']->getNumberOfUserArticleLess();
		$users = $app['dao.user']->selectAll();
		$nbArticles = $app['dao.article']->getNumberArticle();
		$nbArticlesPu = $app['dao.article']->getNumberArticlePublic();
		$nbArticlesPr = $app['dao.article']->getNumberArticlePrivate();
		$articles = $app['dao.article']->selectAllWithPrivate();
	  	$categories = $app['dao.category']->selectAll();
	  	$moyenne = $app['dao.article']->getAverage();
	  	$state = $this->articleState($app, $articles);
	  	$data = array("nbUsers"=>$nbUsers, "nbUsersArticleLess"=>$nbUsersArticleLess,
	  	"users"=>$users, "articles"=>$articles, "nbArticles"=>$nbArticles, 
	  	"nbArticlesPu"=>$nbArticlesPu, "nbArticlesPr"=>$nbArticlesPr, "categories"=>$categories,
	  	"moyenne"=>$moyenne, "state"=>$state);
	  	return $this->render($app, $data);
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
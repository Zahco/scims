<?php

namespace Web\Controllers;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use \Utilities\ObjectConverter;
use \Utilities\Converter;
use Silex\Application;

class Article extends Controller {

  public function articles(Application $app) {
    $articles = $app['dao.article']->selectAll();
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    return $this->render($app, $this->addCategoryInArticle($app, $articles));
  }

  public function create(Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $categories = $app['dao.category']->selectAllOrderByPopularity();
    return $this->render($app, $categories);
  }

  public function creating(Application $app, Request $request) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $article = new \Domain\Models\Article();
    $article->set("UserId", $app["session"]->get("userId"));
    $article->set("Title", $request->get("Title"));
    $article->set("CategoryId", $request->get("CategoryId"));
    $article->set("Author", $request->get("Author"));

    $article->set("StateId", $app['dao.state']->selectByName('Private')->get('Id'));
    $article->set("Vues", 0);

    $app['dao.article']->insert($article);
    return $app->redirect(
      $app["url_generator"]->generate("articleEditor", array("articleId" => $article->get("Id"))));
  }

  public function view($Id, Application $app) {
    $article = $app['dao.article']->select($Id);
    $article->addOneVue();
    $app['dao.article']->update($article);
    $user = $app['dao.user']->select($article->get("UserId"));
    $following = $app['dao.follower']->getId($article->get('UserId'), $app["session"]->get("userId"));
    $following = ($following->get('Id') != null);
    $data = array('article' => $article, 'isOwner' => $article->isOwner($app["session"]->get("userId")), 'userEditor' => $user, 'following' => $following);
    return $this->render($app, $data);
  }

  public function articlesByUser(Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $userId = $app["session"]->get("userId");
    $articles = $app['dao.article']->selectAllByUser($userId);
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    return $this->render($app, $this->addCategoryInArticle($app, $articles));
  }

  public function articlesByCategory($categoryId, Application $app) {
    $articles = $app['dao.article']->selectByCategory($categoryId);
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    $data  = ObjectConverter::anyToArray(array("Model" => $this->addCategoryInArticle($app, $articles)));
    return $app['twig']->render("Article/articles.html.twig", $data);
  }

  public function articlesByRegex(Application $app, Request $request) {
    $articles = $app['dao.article']->selectByRegex($request->get("Regex"));
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    $data  = ObjectConverter::anyToArray(array("Model" => $this->addCategoryInArticle($app, $articles)));
    return $app['twig']->render("Article/articles.html.twig", $data);
  }

  public function editor($articleId, Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $article = $app['dao.article']->select($articleId);
    if (!$article->isOwner($app["session"]->get("userId"))) {
      return "not owner of the doc";
    }

    $state = $app['dao.state']->select($article->get("StateId"));
    $article->IsPublic = $state->get("Name") == "Public";

    return $this->render($app, array("article" => $article, "categories" => $app['dao.category']->selectAllOrderByPopularity()));
  }

  public function editing(Application $app, Request $request) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $article = $app['dao.article']->select($request->get("Id"));
    if (!$article->isOwner($app["session"]->get("userId"))) {
      return "not owner of the doc";
    }
    if (urldecode($request->get("State")) == "true") {
      $article->set("StateId", $app['dao.state']->selectByName('Public')->get('Id'));
    } else {
      $article->set("StateId", $app['dao.state']->selectByName('Private')->get('Id'));
    }

    $article->set("Content", rawurldecode($request->get("Content")));
    $article->set("Title", urldecode($request->get("Title")));
    $article->set("Author", urldecode($request->get("Author")));
    $article->set("CategoryId", urldecode($request->get("CategoryId")));
    $article->addTag(urldecode($request->get("Tags")));
    if (!$article->isValidContent()) {
      return "invalid content";
    }
    $article->set("LastModified", null);

    $app['dao.article']->update($article);
    return $app->redirect(
      $app["url_generator"]->generate("articleView", array("Id" => $article->get("Id"))));
  }

  public function remove($articleId, Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $article = $app['dao.article']->select($articleId);
    if (!$article->isOwner($app["session"]->get("userId"))) {
      return "not owner of the doc";
    }
    return $this->render($app, $article);
  }

  public function removing($articleId, Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $article = $app['dao.article']->select($articleId);
    if (!$article->isOwner($app["session"]->get("userId"))) {
      return "not owner of the doc";
    }
    $app['dao.article']->delete($article);
    return $this->redirectBind($app, "articlesByUser");
  }

  public function viewOfUser($userId, Application $app) {
    $articles = $app['dao.article']->selectAllPublicByUser($userId);
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    $data  = ObjectConverter::anyToArray(array("Model" => $this->addCategoryInArticle($app, $articles)));
    return $app['twig']->render("Article/articles.html.twig", $data);
  }

  public function latexConverter(Application $app, Request $request) {
    return Converter::latexToMathml($request->get("data"));
  }

  public function tagKiller(Application $app, Request $request) {
    $article = $app['dao.article']->select($request->get("Id"));
    $article->set("Tags", $request->get("Tags"));
    $app['dao.article']->update($article);
    return true;
  }

  public function allSubscription(Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $articles = $app['dao.article']->selectArticlesBySubscription($app["session"]->get("userId"));
    foreach ($articles as $article) {
      $article->setContentWithSummary();
    }
    $data  = ObjectConverter::anyToArray(array("Model" => $this->addCategoryInArticle($app, $articles)));
    return $app['twig']->render("Article/articles.html.twig", $data);
  }

  private function addCategoryInArticle(Application $app, $articles) {
    $result = array();
    foreach ($articles as $id => $article) {
      $category = $app['dao.category']->select($article->get("CategoryId"));
      $article->Category = $category;
      $result[$id] = $article;
    }
    return $result;
  }
}

?>

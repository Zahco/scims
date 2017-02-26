<?php
use Symfony\Component\Debug\ErrorHandler;
use Symfony\Component\Debug\ExceptionHandler;

ErrorHandler::register();
ExceptionHandler::register();

$app->register(new Silex\Provider\DoctrineServiceProvider());
$app->register(new Silex\Provider\TwigServiceProvider(), array(
  'twig.path' => __DIR__.'/../Web/Views',
));

$app->register(new Silex\Provider\HttpFragmentServiceProvider());
$app->register(new Silex\Provider\UrlGeneratorServiceProvider());
$app->register(new Silex\Provider\SessionServiceProvider());

$app['dao.user'] = function ($app) {
  return new \Domain\DAO\UserDAO($app['db']);
};
$app['dao.category'] = function ($app) {
  return new \Domain\DAO\CategoryDAO($app['db']);
};
$app['dao.article'] = function ($app) {
  return new \Domain\DAO\ArticleDAO($app['db']);
};
$app['dao.state'] = function ($app) {
  return new \Domain\DAO\StateDAO($app['db']);
};
$app['dao.status'] = function ($app) {
  return new \Domain\DAO\StatusDAO($app['db']);
};
$app['dao.follower'] = function ($app) {
  return new \Domain\DAO\FollowerDAO($app['db']);
};

?>
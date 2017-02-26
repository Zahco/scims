<?php
ini_set('display_errors', 1);

require_once '../vendor/autoload.php';

$app = new Silex\Application();

require __DIR__.'/../Config/App.php';
require __DIR__.'/../Config/Config.php';
require __DIR__.'/../Config/Routes.php';

$app->run();
?>
<?php

namespace Web\Controllers;

use Silex\Application;

class Category extends Controller {

  public function categories(Application $app) {
    $categories = $app['dao.category']->selectAllOrderByPopularity();
    return $this->render($app, $categories);
  }

  public function allCategories(Application $app) {
    $categories = $app['dao.category']->selectAllOrderByPopularity();
    return $this->render($app, $categories);
  }

}
?>
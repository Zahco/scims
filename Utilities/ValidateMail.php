<?php

namespace Utilities;
use Silex\Application;

class validateMail {

  public static function validateMail(Application $app, $email) {
    return (($app['dao.user']->getNumberOfSpecificMail($email) == 0) && filter_var($email, FILTER_VALIDATE_EMAIL));
  }
}
?>
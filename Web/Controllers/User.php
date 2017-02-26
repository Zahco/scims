<?php

namespace Web\Controllers;

use Silex\Application;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use \Utilities\ValidateMail;

class User extends Controller {

  public function registering(Application $app, Request $request) {
    $mail = $request->get("Email");
    $valid = ValidateMail::validateMail($app,$mail);
    if ($valid) {
      $user = new \Domain\Models\User();
      $user->set("Pseudo", $request->get("Pseudo"));
      $user->set("Email", $mail);
      $user->set("Password", $request->get("Password"));
      $app['dao.user']->insert($user);
      $app["session"]->set("userId", $user->get("Id"));
      return $this->redirectBind($app, "home");
    } else {
        $Model = array('Model' => array('isValidMail' => $valid));
        return $app['twig']->render('User/signIn.html.twig', $Model);

    }
  }

  public function signIn(Application $app) {
    return $this->render($app);
  }

  public function logingOn(Application $app, Request $request) {
    $user = $app['dao.user']->selectByEmail($request->get("Email"));
    if (!$user->isPassword($request->get("Password"))) {
      return $this->redirectBind($app, "signIn");
    }
    session_start();
    session_regenerate_id();
    $app["session"]->set("userId", $user->get("Id"));
    return $this->redirectBind($app, "home");
  }

  public function logOut(Application $app) {
    $app["session"]->set("userId", null);
    return $this->redirectBind($app, "home");
  }

  public function profile(Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $userId = $app["session"]->get("userId");
    $user = $app['dao.user']->select($userId);
    return $this->render($app, $user);
  }

  public function profileUpdate(Application $app, Request $request) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $userId = $app["session"]->get("userId");
    $user = $app['dao.user']->select($userId);

    $pseudo = $request->get("Pseudo");
    $email = $request->get("Email");
    $password = $request->get("Password");
    $valid = ValidateMail::validateMail($app, $email);
    if ($pseudo != "") {
      $user->set("Pseudo", $pseudo);
    }
    if ($valid) {
      $user->set("Email", $email);
    }
    if ($password != "") {
      $user->set("Password", $password);
    }
    $app['dao.user']->update($user);
    return $this->redirectBind($app, "profile");
  }

  public function addFollower($userId, Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $follow = new \Domain\Models\Follower();
    $follow->set("FollowerId", $app["session"]->get("userId"));
    $follow->set("UserId", $userId);
    $app['dao.follower']->insert($follow);
    return $this->redirectBind($app, "home");
  }

  public function deleteFollower($userId, Application $app) {
    if ($app["session"]->get("userId") == null) {
      return $this->redirectBind($app, "signIn");
    }
    $follower = $app['dao.follower']->getId($userId, $app["session"]->get("userId"));
    $app['dao.follower']->delete($follower);
    return $this->redirectBind($app, "home");
  } 
}
?>

<?php

$app['debug'] = true;

$app['db.options'] = array(
    'driver'   => 'pdo_mysql',
    'charset'  => 'utf8',
    'host'     => 'localhost',
    'port'     => '3306',
    'dbname'   => 'scims',
    'user'     => 'scims',
    'password' => 'scims',
);

?>

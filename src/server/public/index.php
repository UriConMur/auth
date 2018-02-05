<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require '../../../vendor/autoload.php';
require_once '../../../config/environment.php';

$app = new \Slim\App;

require '../src/config/db.php';
require '../src/config/controller.php';

// Customer Routes
require '../src/routes/user.php';

$app->run();

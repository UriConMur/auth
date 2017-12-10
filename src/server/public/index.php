<?php
require '../../../vendor/autoload.php';

$app = new \Slim\App;

require '../src/config/db.php';
require '../src/config/controller.php';

// Customer Routes
require '../src/routes/api.php';

$app->run();

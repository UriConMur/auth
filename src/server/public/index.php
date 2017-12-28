<?php
/**
 * PHP Version 5
 *
 * Server Index Doc Comment
 *
 * @category File
 * @package  Server
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */
require '../../../vendor/autoload.php';
require_once '../../../config/environment.php';

$app = new \Slim\App;

require '../src/config/db.php';
require '../src/config/controller.php';

// Customer Routes
require '../src/routes/user.php';

$app->run();

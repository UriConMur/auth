<?php
/**
 * PHP Version 5
 *
 * Server Index Doc Comment
 *
 * @category File
 * @package  Server
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  hhtp://www.localhost.com/LICENSE.html GNU General Public License
 * @link     hhtp://www.localhost.com/bbox-login
 */
require '../../../vendor/autoload.php';
require '../../../config/environment.php';

$app = new \Slim\App;

require '../src/config/db.php';
require '../src/config/controller.php';

// Customer Routes
require '../src/routes/api.php';

$app->run();

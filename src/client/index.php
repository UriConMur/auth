<?php
/**
 * PHP Version 5
 *
 * Middleware Doc Comment
 *
 * @category Middleware
 * @package  Home
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

$uuid = "unou"; // unique number of user (uuid)
if (!isset($_COOKIE[$uuid])) {
    include_once 'pages/home/index.php';
} else {
    if (isset($_GET['redirect_to'])){
        $redirect = $_GET['redirect_to'];
        header("location: $redirect");
    } else {
        header("location: {$_ENV['DOMAIN']}/bbox-platform");
    }
}

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

require '../../config/environment.php';

$cookie_name = 'unou';
if (! isset($_COOKIE[ $cookie_name ]) ) {
    include 'pages/login/index.html';
} else {
    if (isset($_GET['p']) ) {
        $redirect = $_GET['p'];
        include "pages/{$redirect}/index.html";
    } else {
        if (isset($_GET['redirect_to']) ) {
            $redirect = $_GET['redirect_to'];
            header("location: $redirect");
        } else {
            include 'pages/home/index.html';
        }
    }
}

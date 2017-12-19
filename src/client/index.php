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
$cookie_name = "username";
if (!isset($_COOKIE[$cookie_name])) {
    include_once 'pages/home/index.php';
} else {
    header("location: http://www.beliveo.com");
}

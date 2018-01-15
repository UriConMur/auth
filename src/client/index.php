<?php
require '../../config/environment.php';

$cookie_name = 'unou';
if (! isset($_COOKIE[ $cookie_name ])) {
    include 'pages/login/index.html';
} else {
    if (isset($_GET['p'])) {
        $redirect = $_GET['p'];
        include "pages/{$redirect}/index.html";
    } else {
        if (isset($_GET['redirect_to'])) {
            $redirect = $_GET['redirect_to'];
            header("location: $redirect");
        } else {
            include 'pages/home/index.html';
        }
    }
}

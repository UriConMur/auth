<?php
/**
 * PHP Version 5
 *
 * Api Doc Comment
 *
 * @category File
 * @package  DB
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->post(
    '/user/login/', function (
        Request $request,
        Response $response
    ) {
            $user = trim($request->getParam("userName"));
            $pass = trim($request->getParam("password"));
            $code = 200;
            switch ($code) {
        case 200:
            $message = "User found";
            break;
        case 404:
            $message = "Not found";
            break;
        case 409:
            $message = "User not found";
            break;
            }
            $body = new stdClass();
            $status = new stdClass();
            $response_obj = new stdClass();
            $body->user = $user;
            $body->pass = $pass;
            $status->code = $code;
            $status->message = $message;
            $response_obj->body = $body;
            $response_obj->status = $status;

            echo json_encode($response_obj);
    }
);

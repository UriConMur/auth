<?php
/**
 * PHP Version 5
 *
 * Api Doc Comment
 *
 * @category File
 * @package  DB
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  hhtp://www.localhost.com/LICENSE.html GNU General Public License
 * @link     hhtp://www.localhost.com/bbox-login
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
            $message = "Usuario encontrado";
            break;
        case 404:
            $message = "Not found";
            break;
        case 409:
            $message = "Usuario no encontrado";
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

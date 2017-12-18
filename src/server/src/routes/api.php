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
    '/api/login',
    function (Request $request, Response $response) {
        $case = 2;
        $user = trim($request->getParam("user"));
        $pass = trim($request->getParam("password"));
        $data = join("|-|", array($user, $pass));
        $editor = 100000;
        $sql = "CALL sp_login_user_get(:case, :data, :editor)";
        $results = getDBData($sql, $case, $data, $editor);
        if (count($results)>0) {
            $code = 200;
        } else {
            $code = 404;
        }
        switch ($code) {
        case 200:
            $message = "User found";
            break;
        case 404:
            $message = "User not found";
            break;
        default:
            $message = "Internal Error";
            break;
        }
        $body = new stdClass();
        $status = new stdClass();
        $response_obj = new stdClass();
        $body->user = $results[0];
        $status->code = $code;
        $status->message = $message;
        $response_obj->body = $body;
        $response_obj->status = $status;

        echo json_encode($response_obj);
    }
);

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
        $username = trim($request->getParam("user"));
        $pass = trim($request->getParam("password"));

        $iterations = 100;
        $seed = "f%uuu%erw9875487ot56.2{dskj-*/-*";
        $enc_pass = hash_pbkdf2("sha256", $pass, $seed, $iterations, 35);
        $data = join("|-|", array($username, $enc_pass));
        $editor = 100000;
        $sql = "CALL sp_login_user_get(:case, :data, :editor)";
        $results = getDBData($sql, $case, $data, $editor);

        $body = new stdClass();
        $status = new stdClass();
        $user = new stdClass();
        $response_obj = new stdClass();
        if (count($results)>0) {
            $user->uuid = base64_encode($results[0]->uuid);
            $user->name = "beliveo";
            $body->user = $user;
            $status->code = 200;
            $status->message = "User found";

        } else {
            $status->code = 404;
            $status->message = "User not found";
        }

        $response_obj->body = $body;
        $response_obj->status = $status;

        echo json_encode($response_obj);
    }
);

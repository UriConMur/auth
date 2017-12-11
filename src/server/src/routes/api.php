<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->post('/user/', function(Request $request, Response $response){
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
    $body -> user = $user;
    $body -> pass = $pass;
    $status -> code = $code;
    $status -> message = $message;
    $response_obj -> body  = $body;
    $response_obj -> status = $status;

    echo json_encode($response_obj);
});

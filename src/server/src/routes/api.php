<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->get('/{id}', function(Request $request, Response $response){
    $data=$request->getAttribute("id");
    echo $data;
});

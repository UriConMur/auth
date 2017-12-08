<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->get('/{id}', function(Request $request, Response $response){
    $case = 1;
    $data=$request->getAttribute("id");
    $editor = 100000;
    $sql = "CALL sp_get_url(:case, :data, :editor)";
    $results = getDBData($sql, $case, $data, $editor);
    $new_url=$results[0]->url;
    $new_url = filter_var($new_url, FILTER_SANITIZE_URL);
    if (filter_var($new_url, FILTER_VALIDATE_URL) === FALSE) {
        echo "Not a Valid URL";
    }else{
        echo "<script>window.location.href='$new_url'; </script>";
    }
});

$app->post('/url/add/', function(Request $request, Response $response){
    $original = trim($request->getParam("original"));
    $original = filter_var($original, FILTER_SANITIZE_URL);
    $new = trim($request->getParam("new_url"));
    if(filter_var($new, FILTER_VALIDATE_URL)===FALSE && $new!==""){
        $new = str_replace("/", "", $new);
        if(filter_var($original, FILTER_VALIDATE_URL)===FALSE){
            echo '[{"text" : "Not Valid URL" , "status":"2"}]';
        }else{
            $case = 1;
            $data=$original."|-|".$new."|-|";
            $editor = 100000;
            $sql = "CALL sp_set_url(:case, :data, :editor)";
            $results = setDBData($sql, $case, $data, $editor);
            echo json_encode($results);
        }
    }else{
        echo '[{"text" : "Not Valid URL" , "status":"3"}]';
    }


});

$app->get('/urls/', function(Request $request, Response $response){
    $case = 2;
    $data=0;
    $editor = 100000;
    $sql = "CALL sp_get_url(:case, :data, :editor)";
    $results = getDBData($sql, $case, $data, $editor);
    echo json_encode($results);
});

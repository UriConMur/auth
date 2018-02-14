<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->post(
    '/user/login',
    function ( Request $request, Response $response ) {
        $case     = 2;
        $username = trim($request->getParam('user'));
        $pass     = trim($request->getParam('password'));

        $iterations = 100;
        $seed       = 'f%uuu%erw9875487ot56.2{dskj-*/-*';
        $enc_pass   = hash_pbkdf2('sha256', $pass, $seed, $iterations, 35);
        $data       = join('|-|', array( $username, $enc_pass ));
        $editor     = $_SESSION['id_employee'];
        $sql        = 'CALL sp_login_user_get(:case, :data, :editor)';
        $results    = getDBData($sql, $case, $data, $editor);

        $body         = new stdClass();
        $status       = new stdClass();
        $user         = new stdClass();
        $response_obj = new stdClass();
        if (count($results) > 0) {
            $user->uuid      = base64_encode($results[0]->uuid);
            $body->user      = $user;
            $status->code    = 200;
            $status->message = 'User found';
            $_SESSION["id_employee"]=$results[0]->id_employee;
            $_SESSION["id_position"]=$results[0]->id_position;
            $_SESSION["name_employee"]=$results[0]->name;
        } else {
            $status->code    = 404;
            $status->message = 'User not found';
        }

        $response_obj->body   = $body;
        $response_obj->status = $status;

        echo json_encode($response_obj);
    }
);

$app->post(
    '/user/create', function (Request $request, Response $response) {
    	$case = 1;
      $name = $request->getParam("name");
      $middle = $request->getParam("middle");
      $last = $request->getParam("last");
      $second = $request->getParam("second");

    	$data=join('|-|', array($name, $middle, $last, $second));
      $editor = $_SESSION['id_employee'];
      $sql = "CALL sp_login_user_set(:case, :data, :editor)";
	    $results = getDBData($sql, $case, $data, $editor);

      $user         = new stdClass();
      $status       = new stdClass();
      $response_obj = new stdClass();

      if (count($results) > 0) {
          $user->cun      = $results[0]->cun;
          $status->code    = 201;
          $status->message = 'User created';
      } else {
          $status->code    = 500;
          $status->message = 'User not created';
      }

      $response_obj->user   = $user;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

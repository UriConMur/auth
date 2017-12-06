<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

$app = new \Slim\App;
$app->get('/', function () {
    echo "hola";
});
$app->run();
?>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Beliveo bBox - Powered by people</title>
		<link href="src/client/css/styles.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
			<div class="contenedor-form">
				<form action="#" class="form">
					<div class="logo-div">
						<h2>Login</h2>
						<img src="src/client/img/beliveo logo.png" border="0">
					</div>
					<input type="text" placeholder="Usuario" required>
					<input type="password" placeholder="Contraseña" required>
					<input type="submit" value="Iniciar Sesión">
				</form>
				<div class="reset-password">
						<a href="#">Olvidé mi contraseña</a>
				</div>
			</div>
	</body>
</html>

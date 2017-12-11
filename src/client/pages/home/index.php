<?php include_once '../../../../config/index.php'; ?>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Beliveo bBox - Powered by people</title>
		<script src="node_modules/jquery/dist/jquery.js"></script>
		<link href="src/client/pages/home/css/styles.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
			<div class="contenedor-form">
				<form action="#" class="form">
					<div class="logo-div">
						<h2>Login</h2>
						<img src="src/client/pages/home/img/beliveo logo.png" border="0">
					</div>
					<input id="username" type="text" placeholder="Usuario" required>
					<input id="password" type="password" placeholder="Contraseña" required>
					<input id="submit_form" type="submit" value="Iniciar Sesión">
				</form>
			</div>
	</body>
	<script>


	    $(document).ready(function(){
	        var api_url = "<?php echo $_ENV['DOMAIN'].$_ENV['API']; ?>";

					$("#submit_form").click(function(e){
						e.preventDefault();
						var user = $("#username").val();
						var pass = $("#password").val();
						console.log(user, pass);
						var data_json = JSON.stringify({userName: user, password: pass});
						$.ajax({
								type:   "POST",
								contentType: 'application/json',
								url: api_url+"/user/",
								dataType: "json",
								data:  data_json,
								cache:  false,
								beforeSend: function(){},
								success: function(data, textStatus, jqXHR){
										var url = data;
										data = eval(data);
										console.log(data);
								},
								error: function(jqXHR, textStatus, errorThrown){
										console.log(jqXHR);
								}
						});
					});

	    });

	</script>
</html>

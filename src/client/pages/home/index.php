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
					<input type="text" placeholder="Usuario" required>
					<input type="password" placeholder="Contraseña" required>
					<input type="submit" value="Iniciar Sesión">
				</form>
			</div>
	</body>
	<script>
			var api_url = "<?php echo $_ENV['DOMAIN'].$_ENV['API']; ?>";

	    $(document).ready(function(){
	        function get_url_list(){
	            $.ajax({
	                type:   "GET",
	                contentType: 'application/json',
	                url: api_url+"/123",
	                dataType: "json",
	                data:  "",
	                cache:  false,
	                beforeSend: function(){},
	                success: function(data, textStatus, jqXHR){
	                    var url = data;
	                    console.log(data);
	                },
	                error: function(jqXHR, textStatus, errorThrown){
	                    console.log(jqXHR);
	                }
	            });
	        }
	        get_url_list();
	    });
	</script>
</html>

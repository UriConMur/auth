<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Beliveo bBox - Powered by people</title>
		<script src="node_modules/jquery/dist/jquery.js"></script>
		<script src="node_modules/beliveo-files/utils/urlFix/index.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	</head>
	<body>
		<div>
			<center><h2>CREATE NEW USER</h2></center></br>
		</div>
		<div>
			<center>
			<form>
				<input id="txtName" type="text" placeholder="Name"> </br>
				<input id="txtMiddle" type="text" placeholder="Middle name"> </br>
				<input id="txtLastName" type="text" placeholder="Last name"> </br>
				<input id="txtSecondLast" type="text" placeholder="Second Last name"> </br></br>
				<button type="button" id="btnCreateUser">Create user</button>
      </form>
			<div>
			</br> <label> bBox and Windows user: </label> </br>
				<input id="txtNewUser" type="text" readonly>
			</div>
			</center>
		</div>
		<script type="text/javascript" src="src/client/pages/create_user/js/functions.js"></script>
	</body>
</html>

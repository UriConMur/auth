<!DOCTYPE html>
<html>
<head>
<title>Beliveo Authentication</title>
  <script src="node_modules/beliveo-files/utils/urlFix/index.js"></script>
  <link rel="stylesheet" type="text/css" href="node_modules/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" type="text/css" href="node_modules/bootstrap/dist/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="node_modules/beliveo-files/styles/main.css">
</head>
<body>
<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require '../../config/environment.php';
?>
<?php require_once '../../node_modules/beliveo-files/components/header.php'; ?>
<div class='row'>
  <div class="body_container col col-md-12">
    <?php
      $cookie_name = 'unou';
    if (! isset($_COOKIE[ $cookie_name ])) {
        session_destroy();
        include 'pages/login/index.php';
    } else {
        if (isset($_GET['p'])) {
            $redirect = $_GET['p'];
            include "pages/{$redirect}/index.php";
        } else {
            if (isset($_GET['redirect_to'])) {
                $redirect = $_GET['redirect_to'];
                header("location: $redirect");
            } else {
                header("location: {$_ENV['DOMAIN']}/bbox");
            }
        }
    }
    ?>
  </div>
</div>

<?php require_once '../../node_modules/beliveo-files/components/footer.php'; ?>
</body>
</html>

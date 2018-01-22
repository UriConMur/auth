<!DOCTYPE html>
<html>
<head>
<title>Beliveo</title>
  <link rel="stylesheet" type="text/css" href="node_modules/beliveo-files/styles/main.css">
</head>
<body>
<?php require_once '../../node_modules/beliveo-files/components/header.php'; ?>
<div class="body_container">
    <?php
      require '../../config/environment.php';
      $cookie_name = 'unou';
    if (! isset($_COOKIE[ $cookie_name ])) {
        include 'pages/login/index.html';
    } else {
        if (isset($_GET['p'])) {
            $redirect = $_GET['p'];
            include "pages/{$redirect}/index.html";
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

<?php require_once '../../node_modules/beliveo-files/components/footer.php'; ?>
</body>
</html>

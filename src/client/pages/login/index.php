<head>
    <script src="node_modules/jquery/dist/jquery.js"></script>
    <link href="src/client/pages/login/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<div>
  <div class="contenedor-form">
      <form action="#" class="form">
      <div class="logo-div">
          <h2>Beliveo System Authentication</h2>
          <img src="node_modules/beliveo-files/images/beliveologo.png" alt="/">
      </div>
      <input id="username" type="text" placeholder="User" required>
      <input id="password" type="password" placeholder="Password" required>
      <input id="submit_form" type="submit" value="Log in">
      </form>
  </div>
  <div id="wrong_data" class="wrong_hidden">
      <span>Wrong User or Password</span>
  </div>
  <script type="text/javascript" src="src/client/pages/login/js/index.js"></script>
</div>

$(document).ready(
    function () {
        //var api_url = "<?php echo $_ENV['DOMAIN'].$_ENV['API']; ?>";
        var api_url = "src/server/public";

        var get_user =  function (e) {
            e.preventDefault();
            var user = $("#username").val();
            var pass = $("#password").val();
            console.log(user, pass);
            var data_json = JSON.stringify({userName: user, password: pass});
            $.ajax(
                {
                    type:   "POST",
                    contentType: 'application/json',
                    url: api_url+"/user/login/",
                    dataType: "json",
                    data:  data_json,
                    cache:  false,
                    beforeSend: function () {},
                    success: function (data, textStatus, jqXHR) {
                        var url = data;
                        data = eval(data);
                        console.log(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                    }
                }
            );
        }

        $("#submit_form").click(get_user);

    }
);

$(document).ready(
    function () {
        var api_url = "src/server/public";

        var get_user =  function (e) {
            e.preventDefault();
            var user = $("#username").val();
            var pass = $("#password").val();
            var data_json = JSON.stringify({user: user, password: pass});
            $.ajax(
                {
                    type:   "POST",
                    contentType: 'application/json',
                    url: api_url+"/api/login",
                    dataType: "json",
                    data:  data_json,
                    cache:  false,
                    beforeSend: function () {},
                    success: function (data, textStatus, jqXHR) {
                        var response = eval(data);
                        var uuid = response.body.user.uuid;
                        var date = new Date();
                        date.setTime(date.getTime() + 7200000);
                        date = date.toUTCString();
                        var cookieInfo = "username=" + uuid + "; expires=" + date;
                        document.cookie = cookieInfo;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                }
            );
        }

        $("#submit_form").click(get_user);

    }
);


$(document).ready(
    function () {
        var api_url = "src/server/public";

        var get_user =  function (e) {
            e.preventDefault();
            var user = $("#username").val();
            var pass = $("#password").val();
            var encPass = window.btoa(pass);
            var dataJson = JSON.stringify({user: user, password: encPass});
            $.ajax(
                {
                    type:   "POST",
                    contentType: 'application/json',
                    url: api_url+"/api/login",
                    dataType: "json",
                    data:  dataJson,
                    cache:  false,
                    beforeSend: function () {},
                    success: function (data, textStatus, jqXHR) {
                        var response = eval(data);
                        var status = response.status.code;
                        
                        if (status == 404) {
                            if ( $("#wrong_data").hasClass("wrong_hidden") ) {
                                $("#wrong_data").removeClass("wrong_hidden");
                            } else {
                                $("#wrong_data").addClass("wrong_shake");
                                setTimeout(
                                    function() { 
                                        $("#wrong_data").removeClass("wrong_shake");
                                    }, 
                                    1000
                                );
                            }
                            
                        } else {
                            var uuid = response.body.user.uuid;
                            var date = new Date();
                            date.setTime(date.getTime() + 7200000);
                            date = date.toUTCString();
                            console.log(window.atob(uuid));
                            var cookieInfo = "unou=" + uuid + "; expires=" + date + "; path=/";
                            document.cookie = cookieInfo;
                            location.reload();
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                }
            );
        }

        $("#submit_form").click(get_user);

    }
);


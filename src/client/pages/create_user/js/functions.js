$(document).ready(
    function () {
        var api_url = "src/server/public";

        var create_user = function (e) {
            var name = $("#txtName").val()
            var middle = $("#txtMiddle").val()
            var last  = $("#txtLastName").val()
            var second = $("#txtSecondLast").val();
            var dataJson = JSON.stringify({name: name, middle: middle,last:last,second:second});
            if (name != "" & last != "" ) {
                $.ajax(
                    {
                        type: "POST",
                        contentType: 'application/json',
                        url: api_url+"/user/create",
                        dataType: "json",
                        data: dataJson,
                        cache:  false,
                        beforeSend: function () {},
                        success: function (data, textStatus, jqXHR) {
                            var response = eval(data);
                            var code = response.status.code;
                            var message = response.status.message;
                            var message_console = response.status.message_console;

                            switch (code) {
                              case 201:
                                var cun = response.user.user;
                                $("#txtNewUser").val(cun);
                                break;
                              case 500:
                                alert(message);
                                break;
                              case 504:
                                alert(message);
                                console.log(message_console);
                                break;
                              default:
                                console.log(message_console);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(errorThrown);
                        }
                    }
                );
            } else {
                alert("Name and Last name can not be empty");
            }
        }

        $("#btnCreateUser").click(create_user);
    }
);

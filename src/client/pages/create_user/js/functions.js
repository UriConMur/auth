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
                            var status = response.status.code;
                            var message = response.status.message;

                            if (status == 404) {
                                console.log(message);
                            } else {
                                var cun = response.user.cun;
                                $("#txtNewUser").val(cun);
                            };
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(errorThrown);
                        }
                    }
                );
            } else {
                alert("Name and Last name can not be empty");
                console.log("error");
            }
        }

        $("#btnCreateUser").click(create_user);
    }
);

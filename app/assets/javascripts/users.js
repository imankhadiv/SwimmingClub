
$(document).ready(function(){
    $('#user_email').width($('#user_password').width());
    $('#eye1').parent().click(function(){
        var v  = $('#user_password').attr('type');
        if (v === 'password') {
            $('#user_password').attr("type", "text");
        }else{
            $('#user_password').attr('type','password');
        }


    });
    $('#eye2').parent().click(function(){

        var v  = $('#user_password_confirmation').attr('type');
        if (v === 'password') {
            $('#user_password_confirmation').attr("type", "text");
        }else{
            $('#user_password_confirmation').attr('type','password');
        }
    });
    $('#eye3').parent().click(function(){

        var v  = $('#user_current_password').attr('type');
        if (v === 'password') {
            $('#user_current_password').attr("type", "text");
        }else{
            $('#user_current_password').attr('type','password');
        }
    });

});
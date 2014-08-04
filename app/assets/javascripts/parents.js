$(document).ready(function(){

    $('#parent_submit').click(function(){
        var v =  $('#swimmer li').html();
        if (v){
            return true
        }else {
            $('#check').append("<div class='alert alert-danger' role='alert'><br/><p>Please add your child</div></p>");
            return false;
        }
    });
});


$(document).ready(function(){

    $('#parent_submit').click(function(){
        var v =  $('#swimmer li').html();
        if (v){
            return true
        }else {
//            $('#check').remove()
//            $('#check').remove("<div class='alert alert-danger' role='alert'><p>Not Valid</p><br/></div>");
            $('#check .alert').remove();
            $('#check').append("<div class='alert alert-danger' role='alert'><br/><p>Please add your child</div></p>");
            return false;
        }
    });
});


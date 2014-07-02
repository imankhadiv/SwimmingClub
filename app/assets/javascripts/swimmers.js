///**
// * Created by Iman on 02/07/2014.
// */
//function go() {
//    return false;
//
//}
$(document).ready(function(){

    $('#tb').hide()
    $('#swimmer_date_of_birth').datepicker(
       {
          dateFormat: 'dd-mm-yy',
          changeYear: 'true',
          changeMonth: 'true',
          yearRange: "-100:+0"

        }
    );


});


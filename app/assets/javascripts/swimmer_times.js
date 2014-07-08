/**
 * Created by Iman on 02/07/2014.
 */


$(document).ready(function(){
    $('#tb').hide();
    $('#tabs').tabs();
    $('#swimmer_time_date').datepicker(
        {
            dateFormat: 'dd-mm-yy',
            changeYear: 'true',
            changeMonth: 'true',
            yearRange: "-100:+0"

        }
    );


});

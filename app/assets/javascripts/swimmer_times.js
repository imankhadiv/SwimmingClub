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
    $('#result').hide();

    $('a').click(function(){
        $('.alert').remove();
       $('tbody').empty();
        $('#result').hide();


    });


});

//$('#All, #best_times').click(function(){
//
//    $('#result').show();
//    alert('hi')
//
//})
//$('#charts, #search').click(function(){
//
//    $('#result').hide();
//
//});


$(document).ready(function(){

    $('#payment_due_date').datepicker(
        {
            dateFormat: 'dd-mm-yy',
            changeYear: 'true',
            changeMonth: 'true',
            yearRange: '+0:+10',
            required: 'true'

        }
    );

});
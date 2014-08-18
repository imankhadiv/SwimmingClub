$(document).ready(function(){

    $('#payment_due_date, #payment_paid_date').datepicker(
        {
            dateFormat: 'dd-mm-yy',
            changeYear: 'true',
            changeMonth: 'true',
            yearRange: '-2:+10',
            required: 'true'

        }
    );

});
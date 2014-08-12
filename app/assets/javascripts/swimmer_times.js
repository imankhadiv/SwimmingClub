/**
 * Created by Iman on 02/07/2014.
 */


$(document).ready(function(){
//    $('#tb').hide();
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

    $('#charts_fragment, #add_times_fragment, #best_times_fragment, #search_fragment').click(function(){
        $('#result').hide();
        $('#result_tbody').empty();
        $('#result_alert').remove();



    });


});
var M = function($scope,$http){
    var onComplete = function(response){
    $scope.times = response.data;
};
var promise = $http.get("/swimmer_times/2.json");
promise.then(onComplete);
};


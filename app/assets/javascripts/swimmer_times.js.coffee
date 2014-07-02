# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).on "ready page:change", ->
#  alert($('td'.html()))
$(document).ready ->
  $('#tb').hide()
  $('#swimmer_time_date').datepicker(
    {
      dateFormat: 'dd-mm-yy',
      changeYear: 'true',
      changeMonth: 'true',
      minDate: new Date(1,1,1950)
    })

  return


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready, page:change", ->
  $("#contact-content").keyup ->
    content = $("#contact-content").val()
    url = $("#contact-search-path").val()
    record_id = $("#record-id").val()
    $("#contact-search-result").load(url+"?s="+content+"&record_id="+record_id)

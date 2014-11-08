# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready, page:change", ->
  company_id =  $("#company_id").val()
  $("#contact-content-for-filter").hide()
  $("#contact-content").keyup ->
    alert "jaaa"
    content = $("#contact-content").val()
    url = $("#contact-search-path").val()
    record_id = $("#record-id").val()
    $("#contact-search-result").load(url+"?s="+content+"&record_id="+record_id)

  $("#contact_name").keyup ->
    url = "/companies/"+company_id+"/contacts/record_filter_search?s="
    contact_name = $("#contact_name").val()
    $("#contact-search-display").load url+contact_name, ->
      $(".add-contact-record-filter").click ->
        contact_id =  $(@).data("contact-id")
        $("#contact_id").val(contact_id)
        contact_content = $(@).parent().children(".contact-content").html()
        $("#contact-content-for-filter > .contact-content").html(contact_content)
        $("#contact-search").hide()
        $("#contact-content-for-filter").show()

  $("#remove-contact").click ->
    $("#contact-search").show()
    $("#contact-content-for-filter").hide()
    $("#contact_id").val()

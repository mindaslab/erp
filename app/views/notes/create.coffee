$("#note_content").val("")
$("#all-notes").append("<%= escape_javascript render @note %>")
alert "Note added"

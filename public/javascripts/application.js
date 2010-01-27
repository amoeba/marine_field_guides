function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $("#"+method).append("<li>"+ content.replace(regexp, new_id) + "</li>");
}

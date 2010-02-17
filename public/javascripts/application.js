var insert_fields = function(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g");
  $("#"+method).append("<li>" + content.replace(regexp, new_id) + "</li>");
}

var insert_filter = function(content) {
  $("input[type=\"submit\"]").before("<li>" + content + "</li>");
}
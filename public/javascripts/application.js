// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var insert_fields = function(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g");
  $("#"+method).append("<li>" + content.replace(regexp, new_id) + "</li>");
}
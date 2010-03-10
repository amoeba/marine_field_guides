$(document).ready(function() {
  $(".selector").live('change', function() {
    var new_filter_name = $(this).attr('value');
    var new_filter_dom = $("#templates > ." + new_filter_name + " > .filter").first().clone();
    
    var target = $(this).siblings(".filter").first();
    target.replaceWith(new_filter_dom);
    
    attach_autocomplete($("input.autocomplete"));
  });
  
  $("#add-filter").click(add_filter);
});
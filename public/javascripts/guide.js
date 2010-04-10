$(document).ready(function() {
  $(".autocomplete").autocomplete({
    source: "/search/autocomplete",
    minLength: 3,
    focus: function(event, ui) {
      return false;
    },
    select: function(event, ui) {
      $(this).val(ui.item.scientific_name);   
      $("#species").append("<li><input type=\"hidden\" id=\"species__\" name=\"species[][id]\" value=\"" + ui.item.value + "\" /><span class=\"scientific-name\"><a href=\"/species/" + ui.item.value + "\">" + ui.item.label  + "</a></span> <input type=\"button\" class=\"action remove\" value=\"remove\"></li>");
      return false;
    }
  });
  
  $(".remove").live("click", function() {
    $(this).parent().remove();
  });
});
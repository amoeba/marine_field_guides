var insert_fields = function(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g");
  $("#"+method).append("<li>" + content.replace(regexp, new_id) + "</li>");
  
  if(method === "similar_species") {
    attach_autocomplete($(".autocomplete").last());
  }
}

var remove_fields = function(ele) {
  $(ele).parent().hide();
  $(ele).prev("input[type=hidden]").val("1");
}

var attach_autocomplete = function(ele) {
  $(ele).autocomplete({
    source: "/search/autocomplete",
    focus: function(event, ui) {
      return false;
    },
    select: function(event, ui) {
      $(ele).val(ui.item.scientific_name);
      $(ele).prev().val(ui.item.value);
      return false;
    }
  });
}
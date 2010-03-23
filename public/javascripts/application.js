var insert_fields = function(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g");
  $("#"+method).append("<li>" + content.replace(regexp, new_id) + "</li>");
  
  if(method === "similar_species") {
    attach_autocomplete($("#species_similar_species_attributes_" + new_id + "_" + "scientific_name"));
  }
}

var add_filter = function() {
  var filter = $("#templates > .taxonomy").first().clone();
  $("#filters").append(filter);
}

var attach_autocomplete = function(ele) {
  $(".autocomplete").autocomplete({
    source: "/search/autocomplete",
    focus: function(event, ui) {
      $(ele).val(ui.item.label);
      $(ele).prev().val(ui.item.value);
      return false;
    },
    select: function(event, ui) {
      $(ele).val(ui.item.label);
      $(ele).prev().val(ui.item.value);
      return false;
    }
  });
}
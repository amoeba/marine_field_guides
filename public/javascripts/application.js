var insert_fields = function(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g");
  $("#"+method).append("<li>" + content.replace(regexp, new_id) + "</li>");
  
  if(method === "similar_species") {
    attach_autocomplete($("#species_similar_species_attributes_" + new_id + "_" + "scientific_name"));
  }
}

var insert_filter = function(content) {
  $("input[type=\"submit\"]").before("<li>" + content + "</li>");
}

var attach_autocomplete = function(ele) {
  $(ele).autocomplete({
    url: "/search/autocomplete",  
    maxItemsToShow: 10,
    onItemSelect: function(selected, obj) {
      $(obj.dom.$elem).prev().attr("value", selected.data[0]);
    }
  });
}
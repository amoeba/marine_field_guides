$(document).ready(function() {
  $("#itis").click(function() {    
    $("#itis-status").html("Loading, please wait.");
    
    var name = $("#species_taxonomy_attributes_genus").attr('value') + " " + $("#species_taxonomy_attributes_species_name").attr('value');
    
    $.getJSON(
      "/itis/taxonomy",
      { binomial_name: name },
      function(data, status) {
        var message = "";
        
        if($.isEmptyObject(data)) {
          message = "Taxonomy not found in ITIS database."
        } else {
          message = "Successfully loaded Taxonomy from ITIS database."
          
          $.each(data, function(k, v) {
            $("#species_taxonomy_attributes_" + k).attr('value', v);  
          });
        }
        
        $("#itis-status").text(message);
      }
    );
  });
});
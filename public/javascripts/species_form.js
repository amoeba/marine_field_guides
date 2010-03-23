$(".remove-subform").live('click', function() {
  $(this).siblings("type=hidden").val('1');
  $(this).parent().hide();
});
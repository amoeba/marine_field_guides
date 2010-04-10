$(".autocomplete").autocomplete({
  source: '/search/autocomplete',
  select: function(event, ui) {
    $(this).val(ui.item.label);
  }
});
jQuery(function() {
  return $('#event_event_type_name').autocomplete({
    source: $('#event_event_type_name').data('autocomplete-source')
  });
});

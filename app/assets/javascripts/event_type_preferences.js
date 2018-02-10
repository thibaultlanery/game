jQuery(function() {
  return $('#event_type_preference_event_type_name').autocomplete({
    source: $('#event_type_preference_event_type_name').data('autocomplete-source')
  });
});


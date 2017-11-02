$( document ).ready(function() {
  $( ".preference_form" ).hide();

  // $( "#map" ).hide();

    $( ".add_preference" ).click(function() {
      $( ".preference_form" ).toggle('blind', 1000);

    });

});

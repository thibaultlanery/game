

$( document ).ready(function() {
  // $( ".map_xs_js" ).show();
  // $( "#map" ).show();




  // $( ".map_xs_js" ).hide();

  $( ".xs_search_form" ).hide();


    $( ".search_xs_button" ).click(function() {
      $( ".map-result-layout" ).hide('ease');
      $( ".xs_search_form" ).toggle('ease');

    });
    $( ".search_map_xs_button" ).click(function() {
      $( ".xs_search_form" ).hide('ease');
       $( ".map_xs_js" ).toggle('ease');



    //   // $( "#map" ).toggle('ease');

});

});




// }

// $( ".xs_search_bar" ).click(function() {
//   $( ".xs_search_form" ).hide('ease');
// });

// $( ".xs_search_bar" ).click(function() {
//   $( ".xs_search_form" ).hide('ease');
//   // setTimeout(function() {
//   //  $('.loader').fadeOut('fast');
//   //  $('.selectable_restaurants').fadeIn('fast');
//   // }, 1500);
// });

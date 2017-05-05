getPlace_dynamic();

  function getPlace_dynamic() {
             var defaultBounds = new google.maps.LatLngBounds(
             new google.maps.LatLng(-33.8902, 151.1759),
             new google.maps.LatLng(-33.8474, 151.2631));

             var input = document.getElementsByClassName('string required user_input_autocomplete_address');
             var options = {
                 bounds: defaultBounds,
             };

             for (i = 0; i < input.length; i++) {
                 autocomplete = new google.maps.places.Autocomplete(input[i], options);
             }
         }

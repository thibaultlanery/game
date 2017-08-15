(function($){
  $(document).ready(function() {
    $(".mcs-horizontal-example").mCustomScrollbar({
      axis:"x",
      theme:"dark-thick",
      mouseWheel:{
        enable: true
      },
      scrollButtons:{
        enable: true
      },
      keyboard:{
        enable: true
      }
    });
  });
})(jQuery);

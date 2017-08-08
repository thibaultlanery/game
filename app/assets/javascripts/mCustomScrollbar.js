(function($){
  $(window).on("load",function(){
    $(".mcs-horizontal-example").mCustomScrollbar({
      axis:"x",
      theme:"dark-3",
      scrollButtons:{
        enable: true
      },
      scrollButtons:{
        scrollAmount: auto
      },
      keyboard:{
        enable: true
      },
    });
  });
})(jQuery);

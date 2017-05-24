var previousScroll = 0;
var head_top = 100;
var dis_top = 200;

document.addEventListener("turbolinks:load", function() {
  $('.page-scroll').click(function() {
    var position_div = $(this).attr('href');
    if(position_div == '#home'){
      $('html, body').stop().animate({scrollTop: 0}, 1000);
    } else {
      var position_top = $(position_div).position().top;
      $('html, body').stop().animate({scrollTop: position_top - 50}, 1000);
    }
    return false;
  });


$(window).on('scroll', function(){
  var scroll_top = $(window).scrollTop();
  var image_share_top = $('#image_share').position().top;
  if (scroll_top < image_share_top -dis_top) {
    $('.page-scroll').parent().removeClass('active');
    $('#_home').addClass('active');
  }
  else if (scroll_top > image_share_top - dis_top) {
    $('.page-scroll').parent().removeClass('active');
    $('#_image_share').addClass('active');
  }
  if (scroll_top > head_top) {
    $('#mainNav').addClass('color-header');
  } else {
    $('#mainNav').removeClass('color-header');
  }
});

  var flash = function(){
    setTimeout(function(){
      $('.flash').slideUp(1000);
    }, 1500);
  };
  $(document).ready(flash);
  $(document).on('page:load', flash);
  $(document).on('page:change', flash);
});

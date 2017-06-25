document.addEventListener('turbolinks:load', function() {
  var fixed = false;
  $(document).scroll(function() {
    if ($(this).scrollTop() > 250) {
      if (!fixed) {
        fixed = true;
        $('#to-top').show('slow', function() {
          $('#to-top').css({
            position: 'fixed',
            display: 'block'
          });
        });
      }
    } else {
      if (fixed) {
        fixed = false;
        $('#to-top').hide('slow', function() {
          $('#to-top').css({
            display: 'none'
          });
        });
      }
    }
  });
});

$(document).on('click', '#to-top', function() {
  $('html, body').animate({
    scrollTop: 0
  }, 1000);
});

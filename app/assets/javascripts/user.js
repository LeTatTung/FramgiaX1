document.addEventListener('turbolinks:load', function() {
  $('.avatar-file-field').change(function(){
    readURL(this);
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img-user-avatar-file-field').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(document).on('click', '.user-edit-btn', function() {
    $('.user-infomation').hide();
    $('.user-form-edit').show();
    $('html, body').animate({
      scrollTop: $('.user-info').position().top
    }, 500);
  });

  $(document).on('click', '.user-form-btn-cancel', function(e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: 0
    }, 500);
    $('.user-form-edit').hide();
    $('.user-infomation').show();
  });
});

document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.image-file-field').change(function(){
      readURL(this);
    });

    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('.image-panel').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
      }
    }
  });
});

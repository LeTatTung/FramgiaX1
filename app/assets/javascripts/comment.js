
$(document).on('click', '.comment-edit-btn', function() {
  $('#image-comment-' + $(this).context.id).hide();
  $('#image-comment-edit-form-' + $(this).context.id).show();
  $('#comment-form-content-' + $(this).context.id).focus();
});

$(document).on('click', '.comment-edit-btn-cancel', function() {
  $('#image-comment-' + $(this).context.id).show();
  $('#image-comment-edit-form-' + $(this).context.id).hide();
});

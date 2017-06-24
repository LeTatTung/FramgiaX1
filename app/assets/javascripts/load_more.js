$(document).on('click', '.load-more',function() {
  if($(this).prev().is(':visible')) {
    $(this).text('Load more');
    $(this).prev().hide();
  } else {
    $(this).text('Load less');
    $(this).prev().show();
  }
});

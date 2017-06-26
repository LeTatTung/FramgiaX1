var timer, length_str = 27, length_item = 4;
$(document).on('keyup', '#images-search', function() {
  clearTimeout(timer);
  timer = setTimeout(function () {
    var search = $('#images-search').val();
    $.ajax({
      url: '/searches?search=' + search,
      context: document.body,
      dataType: 'json'
    }).done(function(data) {
      $('.results').empty();
      var images = data.images;
      if(images.length) {
        $('.results').append('<p><b>Image</b></p><hr>');
        for (var i = 0; i < images.length; i++) {
          $('.results').append('<a href="/images/' + images[i].id
            +'"><li><span class="images-search-img"><img src="'
            + images[i].image.url + '"></span><span class="images-search-str">'
            + images[i].description.substring(0, length_str) + '</span></li></a><hr>');
          if(i == length_item) break;
        }
      }

      var users = data.users;
      if(users.length) {
        $('.results').append('<p><b>User</b></p><hr>');
        for (var i = 0; i < users.length; i++) {
          $('.results').append('<a href="/users/' + users[i].id +
            '"><li><span class="users-search-img"><img src="'
            + setAvatar(users[i].sex)
            + '"></span><span class="users-search-str">'
            + users[i].name.substring(0, length_str)
            + '</span></li></a><hr>');
          if(i == length_item) break;
        }
      }

      var addresses = data.addresses;
      if(addresses.length) {
        $('.results').append('<p><b>Address</p><hr>');
        for (var i = 0; i < addresses.length; i++) {
          $('.results').append('<a href="/images/?address=' + addresses[i]
            + '"><li><p class="text-black">' + addresses[i].substring(0, length_str)
            + '</p></li></a><hr>');
          if(i == length_item) break;
        }
      }

      var categories = data.categories;
      if(categories.length) {
        $('.results').append('<p><b>Category</b></p><hr>');
        for (var i = 0; i < categories.length; i++) {
          $('.results').append('<a href="/images/?category=' + categories[i].id
            + '"><li><p class="text-black">' + categories[i].name.substring(0, length_str)
            + '</p class=text-black"></li></a><hr>');
          if(i == length_item) break;
        }
      }

      $('.results').append('<a href="/searches?search=' + search + '"><li><p>'
        + "Load more" + '</p></li></a>');
    });
  }, 1500);
});

function setAvatar(sex) {
  if(sex) {
    return '../../assets/male.png';
  } else {
    return '../../assets/female.png';
  }
}

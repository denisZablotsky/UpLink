function translate(word) {
  var link = '/translate';

  $.ajax({
    url: link,
    method: 'GET',
    data: { word: word },
    success: function (translation) {
      show(translation)
    }
  });
}

function show(data) {
  $('.translate').empty();
  $('.translate').html(data);
}
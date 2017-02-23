$(document).ready(function() {

  $('.navbar').on('click', '.logout', function(e){
    e.preventDefault();

    var $form = $(this);
    var url = $form.attr('action');
    var type = $form.find('.hidden').attr('value');

    $.ajax({url: url, type: type,
    })
    .done(function(response) {
      $('.logout').replaceWith(response);
    })
  })
});


$(document).ready(function() {
  $("#existing_user").hide();
  $('.navbar').on('click', '.login-link', function(e){
    e.preventDefault();
    $("#existing_user").show();
  })
  $('.navbar').on('submit', '#existing_user', function(e){
    e.preventDefault();
    var $form = $(this);
    var url = $form.attr('action');
    var type = $form.attr('method')
    $.ajax({
      url: url,
      type: type,
      dataType: "json",
      data: $form.serialize()
    })
    .done(function(response) {
      $('.navbar-else').replaceWith(response.nav);
      $("#not-logged-in").html(response.link);
    })
  })
  $('.navbar').on('click', '.logout', function(e){
    e.preventDefault();
    var $form = $(this);
    var url = $form.attr('action');
    var type = $form.find('.hidden').attr('value');
    $.ajax({
      url: url,
      type: type,
    })
    .done(function(response) {
      $('.logout').replaceWith(response);
      $("#existing_user").hide();
    })
  });
});


$j(function($) {
  $('#logo_left').click(function() {
    document.location.href='http://comparative-legumes.org';
  });

  $("#tabs").tabs();

  $('form').submit(function() {
    $('input[type=submit]', this).val('Processing...').attr(
      'disabled', 'disabled'
    );
  });

  $(window).unload(function() {
    $('input[type=submit]', 'form').val('Submit').removeAttr('disabled');
  });
});

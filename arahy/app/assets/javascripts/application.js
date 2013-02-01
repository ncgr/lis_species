//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require prototype
//= require prototype_ujs
//= require effects
//= require dragdrop
//= require controls
//= require dropdownnav
//= require_self
//= require_tree .

/**-----------------------------------------------------------------------------
 * Prototype
 *----------------------------------------------------------------------------*/

/**
 * Present user with Taxon Id URL for verification.
 */
var verifyTaxonIdUrl = function verifyTaxonIdUrl(element, param, base_url) {
  if ($(element).next('a')) {
    $(element).next('a').update();
  }
  if (param !== '') {
    $(element).insert({
      after: new Element ('a',
        {
          'class': 'small',
          'target': '_blank',
          href: base_url + param
        }
      ).update('&nbsp;Verify URL &raquo;')
    });
  }
};

/**
 * Show / hide helper for the edit form.
 */
var showHideElementHelper = function showHideElementHelper(form_field, element) {
  if ($(form_field).value === '') {
    $(element).hide();
  }
  $(form_field).observe('change', function() {
    if (this.getValue() === '') {
      $(element).hide();
    } else {
      $(element).show();
    }
  });
};

/**-----------------------------------------------------------------------------
 * jQuery
 *----------------------------------------------------------------------------*/

jQuery(function($) {

  /**
   *  Logo link to home.
   */
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


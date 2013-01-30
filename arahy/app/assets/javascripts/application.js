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
 * Hide Accordions.
 */
function hideAccordions () {
  var verticalAccordions = $$('.accordion_toggle');
  verticalAccordions.each(function(accordion) {
    $(accordion).hide();
  });
}

/**
 * Effect Class Method
 * Creates the show / hide accordion effect for the results page.
 */
Effect.Accordion = function (contentId) {
  var slideDown = 0;
  var slideUp = 0;

  contentId = $(contentId);

  text = ["More [+]", "Close [-]"];
  contentLinkId = contentId.identify() + '_toggle';

  if ($(contentLinkId).innerHTML == text[0]) {
    new Effect.SlideDown(contentId, {duration: slideDown});
    $(contentLinkId).update(text[1]);
  } else {
    new Effect.SlideUp(contentId, {duration: slideUp});
    $(contentLinkId).update(text[0]);
  }
};

/**
 * Change value of the button and disable on submit.
 */
function processingOnSubmit () {
  $$('.submit').each(function(s) {
    s.value = 'Processing...';
    Form.Element.disable(s);
  });
  return true;
}

/**
 * Present user with Taxon Id URL for verification.
 */
function verifyTaxonIdUrl (element, param, base_url) {
  if ($(element).next('a')) {
    $(element).next('a').update();
  }
  if (param != '') {
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
}

/**
 * Show / hide helper for the edit form.
 */
function showHideElementHelper(form_field, element) {
  if ($(form_field).value == '') {
    $(element).hide();
  }
  $(form_field).observe('change', function() {
    if (this.getValue() == '') {
      $(element).hide();
    } else {
      $(element).show();
    }
  });
}

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

});


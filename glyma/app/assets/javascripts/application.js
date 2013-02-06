//= require prototype
//= require prototype_ujs
//= require effects
//= require dragdrop
//= require controls
//= require dropdownnav
//= require_self
//= require_tree .

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

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
    $('submit').value = 'Processing...';
    Form.Element.disable('submit');
    return true;
}


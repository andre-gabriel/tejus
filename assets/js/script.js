
jQuery(document).ready(function() {

    var email = 'geral' + '@' + 'tejus.pt';
    $('#contact-email').attr('href', 'mail' + 'to:' + email).html(email);
});

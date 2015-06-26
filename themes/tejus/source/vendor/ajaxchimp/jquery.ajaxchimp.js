/*!
Mailchimp Ajax Submit
jQuery Plugin
Author: Siddharth Doshi

Use:
===
$('#form_id').ajaxchimp(options);

- Form should have one <input> element with attribute 'type=email'
- Form should have one label element with attribute 'for=email_input_id' (used to display error/success message)
- All options are optional.

Options:
=======
options = {
    language: 'en',
    callback: callbackFunction,
    url: 'http://blahblah.us1.list-manage.com/subscribe/post?u=5afsdhfuhdsiufdba6f8802&id=4djhfdsh99f'
}

Notes:
=====
To get the mailchimp JSONP url (undocumented), change 'post?' to 'post-json?' and add '&c=?' to the end.
For e.g. 'http://blahblah.us1.list-manage.com/subscribe/post-json?u=5afsdhfuhdsiufdba6f8802&id=4djhfdsh99f&c=?',
*/

(function ($) {
    'use strict';

    $.ajaxChimp = {
        responses: {
            'We have sent you a confirmation email'                                             : 0,
            'Please enter a value'                                                              : 1,
            'An email address must contain a single @'                                          : 2,
            'The domain portion of the email address is invalid (the portion after the @:'      : 3,
            'The username portion of the email address is invalid (the portion before the @:'   : 4,
            'This email address looks fake or invalid. Please enter a real email address'       : 5
        },
        translations: {
            'en': null
        },
        init: function (selector, options) {
            $(selector).ajaxChimp(options);
        }
    };

    $.fn.ajaxChimp = function (options) {
        $(this).each(function(i, elem) {
            options = options || {};

            var form = $(elem);

            var settings = $.extend({
                'url': form.attr('action'),
                'language': 'en',
                'email': form.find('input[type=email]')
            }, options);
            var email = settings.email;
            var label = form.data('target') && $(form.data('target')) ||
                form.find('label[for=' + email.attr('id') + ']');

            var url = settings.url.replace('/post', '/post-json').concat('?c=?');

            form.attr('novalidate', 'true');
            email.attr('name', 'EMAIL');

            form.submit(function () {
                var msg;
                function successCallback(resp) {
                    if (resp.result === 'success') {
                        msg = 'We have sent you a confirmation email';
                        label.removeClass('error').addClass('valid');
                        email.removeClass('error').addClass('valid');
                    } else {
                        email.removeClass('valid').addClass('error');
                        label.removeClass('valid').addClass('error');
                        try {
                            var parts = resp.msg.split(' - ', 2);
                            if (parts[1] === undefined) {
                                msg = resp.msg;
                            } else {
                                var i = parseInt(parts[0], 10);
                                if (i.toString() === parts[0]) {
                                    msg = parts[1];
                                } else {
                                    msg = resp.msg;
                                }
                            }
                        }
                        catch (e) {
                            msg = resp.msg;
                        }
                    }

                    var i18n = $.ajaxChimp.translations;

                    // Translate and display message
                    if (settings.language !== 'en' && i18n && i18n[settings.language]) {
                        var translation = i18n[settings.language][$.ajaxChimp.responses[msg]];
                        if (!translation) {
                            // try partial match
                            $.each($.ajaxChimp.responses, function(resp, key) {
                                if (msg.indexOf(resp) > -1) {
                                    translation = i18n[settings.language][key];
                                    return;
                                }
                            });
                        }

                        if (translation) {
                            msg = translation;
                        }
                    }
                    label.html(msg);

                    label.show(2000);
                    if (settings.callback) {
                        settings.callback(resp);
                    }
                }

                var data = form.serialize();
                //$.each(dataArray, function (index, item) {
                //    data[item.name] = item.value;
                //});

                $.ajax({
                    type: 'GET',
                    url: url,
                    data: data,
                    cache: false,
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    crossDomain: true,
                    success: successCallback,
                    error: function (resp, text) {
                        // TODO need to send this in the callback.
                        console.log('mailchimp ajax submit error: ' + text);
                    }
                });

                // Translate and display submit message
                var submitMsg = 'Submitting...';
                if(
                    settings.language !== 'en'
                    && $.ajaxChimp.translations
                    && $.ajaxChimp.translations[settings.language]
                    && $.ajaxChimp.translations[settings.language]['submit']
                ) {
                    submitMsg = $.ajaxChimp.translations[settings.language]['submit'];
                }
                label.html(submitMsg).show(2000);

                return false;
            });
        });
        return this;
    };
})(jQuery);

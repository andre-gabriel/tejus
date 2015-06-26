<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('partial/head') }}
<body>
  {{ partial('partial/header') }}
  {{ body }}
  {{ partial('partial/footer') }}
  {{ js('vendor/jquery/dist/jquery.min.js',
        'vendor/bootstrap/dist/js/bootstrap.min.js',
        'vendor/fancybox/jquery.fancybox.pack.js',
        'vendor/jqBootstrapValidation/dist/jqBootstrapValidation-2.0.0.min.js',
        'vendor/ajaxchimp/jquery.ajaxchimp.js',
        'js/tejus') }}
</body>
</html>

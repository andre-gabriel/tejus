<head>
    <meta charset="utf-8">

    <title>{% if page.title%}{{ page.title }} | {% endif %}{{ config.title }}</title>

    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="{{ config.description }}">
    {%for author in config.authors %}<meta name="author" content="{{ author }}">{% endfor %}

    <!-- Canonical links -->
    <link rel="canonical" href="{{ url }}">

    <!-- build:css build/css/theme.css -->
    {{ css('css/theme', 'vendor/fancybox/jquery.fancybox.css') }}
    <!-- endbuild -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    {{ partial('partial/google-analytics') }}
</head>

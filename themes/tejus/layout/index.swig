
{{ partial('partial/carousel', {expanded: true, items: site.data[page.carousel]}) }}

<div class="container">
    <!-- Marketing Icons Section -->
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">{{page.title}}</h1>
                </div>

                {% set items = site.pages.find({index: true}) %}
                {% set items = items.sort('title', 1) %}
                {% set items = items.limit(2) %}

                {% for item in items %}
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-{{ item.highlight.class}}">
                        <div class="panel-heading">
                            <a href="{{ page_url(item.path) }}">{{ image_tag(item.highlight.img, {class: 'img-responsive', title: item.title}) }}</a>
                            <h4>{{ item.title }}</h4>
                        </div>
                        <div class="panel-body">
                            <p>{{ item.highlight.teaser }}</p>
                        </div>
                    </div>
                </div>
                {% endfor %}
            </div>
        </div>

        {% set promoted = site.pages.findOne({promote: true}) %}

        <div class="col-md-4">
            <div class="row">
                <div class="col-md-12 col-sm-6">
                    <div class="promotions panel panel-warning">
                        <div class="panel-body">
                            <a href="{% if promoted.hasDetail %}{{ page_url(promoted.path) }}{% else %}{{ page_url('contacto/') }}{% endif %}">{{ image_tag(promoted.promo.img, {class: 'img-responsive', title: promoted.title}) }}</a>
                        </div>
                        <span class="ribbon"><a href="{{ page_url('contacto/') }}">Pedir Orçamento</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{ partial('partial/newsletter') }}

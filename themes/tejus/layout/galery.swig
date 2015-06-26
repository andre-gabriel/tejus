<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">{{page.title}}</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
        {{page.content}}
        </div>
    </div>

    {% set items = site.pages.find({type: page.type, active: true}) %}
    {% set items = items.sort('title', 1) %}
    {#% set items = items.limit(1) %#}

    {% for item in items %}
        {% if loop.index % 3 === 1 %} <div class="row"> {% endif %}
            <div class="col-md-4 img-portfolio">
                <a href="{% if item.hasDetail %}{{ url_for(item.path) }}{% else %}{{ url_for('contacto')}}{% endif %}">
                    {{ image_tag(item.thumb, {class: 'img-responsive', title: item.title}) }}
                </a>
                <h3><a href="{% if item.hasDetail %}{{ url_for(item.path) }}{% else %}{{ url_for('contacto')}}{% endif %}">{{ item.title }}</a></h3>
                <p>{{ item.teaser }}</p>
            </div>
        {% if loop.index % 3 === 0 %} </div> {% endif %}
    {% endfor %}
</div>

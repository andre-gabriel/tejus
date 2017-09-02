{%if items %}
<!-- Header Carousel -->
<header id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        {% for item in items %}
        <li data-target="#myCarousel" data-slide-to="{{ loop.index0 }}"{% if loop.first %} class="active"{% endif %}></li>
        {% endfor %}
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        {% for item in items %}
        <div class="item{%if loop.first %} active{% endif %}">
            {% if expanded %}
            <div class="fill" style="background-image:url('{{ page_url(item.path) }}');"></div>
            {% else %}
            {{ image_tag(item.path, {class: 'img-responsive', title: item.title, role: 'presentation'}) }}
            {% endif %}
            <h2>{{item.title}}</h2>
            <h3>{{item.teaser}}</h3>
        </div>
        {% endfor %}
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev" title="Anterior"><span class="icon-prev"></span></a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next" title="Seguinte"><span class="icon-next"></span></a>
</header>
{% endif %}

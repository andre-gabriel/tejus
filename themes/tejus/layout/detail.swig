<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">{{page.title}}</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            {{ partial('partial/carousel', {items: page.detail.imgs}) }}
        </div>

        <div class="col-md-4">
            {{page.content}}
        </div>
    </div>

    <!-- Related Projects Row -->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">{{ page.moreInfo.title }}</h3>
        </div>

        {% for item in page.moreInfo.imgs %}
        <div class="col-sm-3 col-xs-6">
            <a class="fancybox" href="{{ url_for(item.path) }}" rel="gallery-{{ page._id }}">
                {{ image_tag(item.path, {class: 'img-responsive', title: item.title}) }}
            </a>
        </div>
        {% endfor %}
    </div>
</div>

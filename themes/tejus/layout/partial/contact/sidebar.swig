{{page.content}}

{% for contact in page.contacts %}
<p><i class="fa fa-{{ contact.icon }}"></i>
    <abbr title="{{ contact.tooltip }}">{{ contact.label }}</abbr>:
    {% for value in contact.values %}
      {% if !loop.first %}<br>{% endif %}
      {% if contact.type == 'email' %}
      {{ mail_to(value) }}
      {% else %}
      {{ value }}
      {% endif %}
    {% endfor %}</p>

{% endfor %}

<ul class="list-unstyled list-inline list-social-icons">
    <li>
        <a href="http://facebook.com/www.tejus.pt" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
    </li>
    <li>
        <a href="https://twitter.com/tejus_PT" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
    </li>
</ul>

{% for address in page.addresses %}
<p>
    <strong>{{address.title}}</strong> <br>
    {{ address.street }} <br>
    {{ address.zip }} {{address.city}} <br>
    {{ address.country }} <br>
    {% if address.remarks %}{{ address.remarks }}{% endif %}
</p>
{% endfor %}

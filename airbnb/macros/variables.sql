{% macro learn_variables() %}

    {% set your_jinja_name = 'Lokesh' %}
    {{ log("Hello " ~ your_jinja_name, info = True) }}

    {{ log("Hello DBT user " ~ var("user_name","No DBT user found") ~ "!", info=True) }}

{% endmacro %}
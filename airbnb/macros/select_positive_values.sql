{% macro select_positive_values(model, column_name) %}
    select * 
    from {{ model }} 
    where {{ column_name }} > 0
{% endmacro %}


{# to run the above macro
dbt compile --inline "{{ select_positive_values('dim_listings_cleansed','minimum_nights') }}" 
#}
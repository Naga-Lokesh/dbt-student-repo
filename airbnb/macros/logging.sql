{% macro learn_logging() %}

    {{ log("Call your mom!") }}
    {{ log("Call your dad!", info=True) }} {# Logs to the screen, too #}
--  {{ log("Call your dad!", info=True) }} {# This will be logged to the screen #}
    {# log("Call your dad!", info=True) #} {# This wont be executed #}

{% endmacro %}
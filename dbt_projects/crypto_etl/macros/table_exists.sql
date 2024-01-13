{% macro table_exists(table_name) %}
    {% set query %}
        SELECT to_regclass('{{ table_name }}')
    {% endset %}
    
    {% set results = run_query(query) %}
    {% if execute %}
        {% set exists = results.columns[0].values()[0] %}
        {{ return(exists is not none and exists|length > 0) }}
    {% endif %}
{% endmacro %}
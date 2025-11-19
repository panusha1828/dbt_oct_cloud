{% macro jodo(col1,col2) %}
    {{col1}} || ' ' || {{col2}}
{% endmacro %}


{% macro mod_table(table_name) %}
    {{ run_query(
        "alter table " ~ table_name ~ " add column updated_at timestamp"
    ) }}
{% endmacro %}

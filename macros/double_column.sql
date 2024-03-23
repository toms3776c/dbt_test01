{% macro double_column(column_name) %}
    ({{ column_name }} * 2)
{% endmacro %}

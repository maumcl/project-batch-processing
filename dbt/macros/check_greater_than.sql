-- macros/check_greater_than.sql
{% macro test_check_greater_than(model, column_name, value) %}
    select *
    from {{ model }}
    where {{ column_name }} < {{ value }}
{% endmacro %}

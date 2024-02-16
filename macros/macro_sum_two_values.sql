{% macro add_two_ints(x, y) %}
    {{return(x+y)}}
    
{% endmacro %}

{% macro sumuj(x, y) -%}
     {{ x}} + {{y }}
{%- endmacro %}

{% macro split_month_year(date_string) %}
    select
        substring({{ date_string }}, 1, position(' ' in {{ date_string }}) - 1) as month,
        substring({{ date_string }}, position(' ' in {{ date_string }}) + 1) as year
{% endmacro %}

{% macro extract_quarter_from_date_string(date_string) %}
  
  case
    when
      SUBSTR({{ date_string }}, 1, strpos({{date_string}},' ') -1 ) in  ('January', 'February', 'March')
    then '_Q1'

    when
      SUBSTR({{ date_string }}, 1, strpos({{date_string}},' ') -1 ) in  ('April', 'May', 'June')
    then '_Q2'

    when
      SUBSTR({{ date_string }}, 1, strpos({{date_string}},' ') -1 ) in  ('July', 'August', 'September')
    then '_Q3'

    when
      SUBSTR({{ date_string }}, 1, strpos({{date_string}},' ') -1 ) in  ('October', 'November', 'December')
    then '_Q4'

    else 'ERROR'
  end 
{% endmacro %}

{% macro extract_year_from_date_string(date_string) %}
   RIGHT({{ date_string }}, 4)
{% endmacro %}

{% macro get_long_sequence() %}
{% set seq = [1,2,3,4,5,6,7,8,9] %}
  {% for item in seq -%}
    {{ item }}
  {%- endfor %}
{% endmacro %}
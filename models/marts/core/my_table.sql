with orders as (
    select * from {{ref('fct_orders')}}
)

select
  order_id,
  customer_id,
  some_date,
  {{get_long_sequence()}} as my_long_sequence,
  {%set l1 = 21%}
  {% set l2 = 18 %}
  {{add_two_ints(l1,l2)}} as my_number,
  order_id+customer_id as sum_ids,
  {{l1}}+{{l2}} as sum_ls,
  {{sumuj('order_id','customer_id')}} as macro_with_orig_fields,
  {{ extract_quarter_from_date_string('some_date') }} as date_month,
  {{ extract_year_from_date_string('some_date') }} as date_year,
  CONCAT( {{ extract_year_from_date_string('some_date') }},{{ extract_quarter_from_date_string('some_date') }}) as new_date
  
  
from orders
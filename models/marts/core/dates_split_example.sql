with orders as (
    select * from {{ref('fct_orders')}}
),
customers as(
    select * from {{ref('stg_customers') }}
),
orders_with_dates_split as (
  select
    order_id,
    some_date,
    {{add_two_ints(6,9)}} as my_number,
    sum(
        case when is_order_completed = 0 then total_amount else 0 end
    ) as failure_total
  from orders
  group by 1,2,3
)

select * from orders_with_dates_split
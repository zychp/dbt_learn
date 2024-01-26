with customers as (
    select * from {{ref("stg_customers")}}
),

orders as (
    select * from {{ref("stg_orders")}}
),
payments as (
    select * from {{ref("stg_payment")}}
),

customer_amounts as (
    select 
        orders.customer_id,
        sum(case when payments.status = 'success' then payments.amount end ) as total_amount
    from orders
left join payments using(order_id)
group by 1
order by customer_id
),
final as (
    select
       customers.first_name,
       customers.last_name,
       coalesce(customer_amounts.total_amount,0) as total_amount
    from customers left join customer_amounts using(customer_id)
)

select * from final

    
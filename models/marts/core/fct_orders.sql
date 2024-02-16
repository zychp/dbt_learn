with
    orders as (select * from {{ ref('stg_orders') }}),
    payment as (select * from {{ ref('stg_payment') }}),

    order_payments as (
        select order_id, 
        sum(
            case when status = 'success' then amount end
            ) as amount,
        from payment
        group by 1
    ),
    final as (
        select
            orders.order_id,
            orders.customer_id,
            orders.order_date,
            case 
              when orders.status = 'completed'
              then 1 
              else 0 
            end as is_order_completed,
            coalesce(order_payments.amount, 0) as total_amount,
            case
              when orders.order_id > 0 and orders.order_id <= 50 
              then 'January 2023'
              when orders.order_id > 50 and orders.order_id <= 70
              then 'October 2022'
              when orders.order_id > 70 and orders.order_id <= 100
              then 'July 2021'
              else null
              end as some_date,
            case
              when orders.order_id > 0 and orders.order_id <= 50 
              then 'Ado-trastuzumab/ Anastrozole/ Cyclophosphamide/ Docetaxel/ Trastuzumab' 
              when orders.order_id > 50 and orders.order_id <= 70
              then 'Cyclophosphamide/ Doxorubicin/ Letrozole'
              when  orders.order_id > 70 and orders.order_id <= 100
              then 'Pertuzumab, Trastuzumab'
              else null
            end
            as product
        from orders
        left join order_payments using (order_id)
        order by customer_id
    )
select * from final order by is_order_completed desc

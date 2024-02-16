with payments as (
    select * from {{ ref('dim_customers_classified') }}
)

select customer_id,
sum(global_paid_amount) as total_amount
from payments
group by 1
having total_amount < 0
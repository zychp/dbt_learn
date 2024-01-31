with payments as (
    select
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    amount/100 as amount,
    created as created_at,
    status,
    case
      when status = 'success' then true
      else false
      end as is_completed_payment
from {{source('stripe','payment')}}
)
select * from payments

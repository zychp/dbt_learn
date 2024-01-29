select
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    amount/100 as amount,
    created as created_at,
    status

from {{source('stripe', 'payment')}}

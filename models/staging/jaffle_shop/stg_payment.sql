select
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    amount

from `dbt-tutorial`.stripe.payment
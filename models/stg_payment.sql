select
    id as payment_id,
    orderid,
    paymentmethod,
    amount

from `dbt-tutorial`.stripe.payment
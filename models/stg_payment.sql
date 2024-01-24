select
    id as payment_id,
    order_id,
    paymentmethod,
    amount

from `dbt-tutorial`.stripe.payment
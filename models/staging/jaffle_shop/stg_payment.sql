with payment as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        amount / 100 as amount,
        created as created_at,
        status,
        case
            when status = 'success' then true else false
        end as is_completed_payment,
    
        case
            when paymentmethod in ('stripe'
                                ,'paypal'
                                ,'credit_card'
                                ,'gift_card')
            then 'credit'
            else 'cash' end as payment_type

from `dbt-tutorial.stripe.payment`
) 
select * from payment

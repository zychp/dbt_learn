-- testing if the total amount in the stg payments is not negaative
select 
  order_id,
  sum(amount) as total_amount
from {{ref("stg_payment")}}
group by 1
having not (total_amount >= 0 )



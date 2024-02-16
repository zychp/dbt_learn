{#
with chemotherapy as (
    select * from {{ref('seed_chemotherapy')}}
),
#}
with
customers as (
    select * from {{ref('dim_customers_with_products')}}
)

{#
orders_with_mapped_chemotherapy as(
    select
      cs.customer_id,
      cs.orig_prod,
      cs.product,
      ch.*
    from
      customers as cs
      left join chemotherapy as ch
    on
      instr(cs.orig_prod, ch.product) > 0 
      --and (cs.regimen is null)
)
#}


SELECT
    cs.customer_id,
    cs.orig_prod, 
    cs.product
    
    {#ch.*#}
FROM
    customers cs
{#
LEFT JOIN
    chemotherapy ch 
ON
    cs.orig_prod LIKE '%' || ch.product || '%'
#}
order by cs.customer_id
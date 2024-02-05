with fct_orders as (
    select * from {{ ref('fct_orders')}}
),

product_mappings as (
    select * from {{ ref('seed_product_mapping' ) }}
),

orders_with_mapped_products as (
  select 
    fo.customer_id,
    fo.product as orig_prod ,
    pm.*
  from
    fct_orders as fo
    left join product_mappings as pm
    on
    instr(fo.product, pm.product) > 0
    --instr(pm.product, fo.product)>0
    --((fo.product like '%PertuzumabTrastuzumab%') or (fo.product like '%AdoTrastuzumab%'))
    --fo.product LIKE '%' || pm.product || '%'
)

SELECT
    p.customer_id,
    p.orig_prod,
    pm.*
    
FROM
    orders_with_mapped_products p
LEFT JOIN
    product_mappings pm
ON
    p.orig_prod LIKE '%' || pm.product || '%'
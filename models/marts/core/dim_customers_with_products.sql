with fct_orders as (
    select * from {{ ref('fct_orders')}}
),

product_mappings as (
    select * from {{ ref('seed_product_mapping' ) }}
),

orders_with_mapped_products as (
  select 
    fo.customer_id,
    fo.product,
    pm.product as mapping_product,
    pm.regimen
  from
    fct_orders as fo
    left join product_mappings as pm
    on 
    fo.product LIKE '%' || pm.product || '%'
)

SELECT
    p.*,
    pbm.regimen AS mapped_bucket
FROM
    orders_with_mapped_products p
LEFT JOIN
    product_mappings pbm
ON
    p.mapping_product = pbm.product
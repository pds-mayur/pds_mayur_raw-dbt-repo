{{ config(materialized='view') }}

select
    cast(product_id as number) as product_id,
    trim(product_name) as product_name,
    initcap(trim(category)) as category,
    cast(unit_price as number(18,2)) as list_price
from {{ source('raw', 'products') }}
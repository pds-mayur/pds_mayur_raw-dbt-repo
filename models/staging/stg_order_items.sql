{{ config(materialized='view') }}

select
    cast(order_item_id as number) as order_item_id,
    cast(order_id as number) as order_id,
    cast(product_id as number) as product_id,
    cast(quantity as number) as quantity,
    cast(unit_price as number(18,2)) as unit_price,
    cast(line_total as number(18,2)) as line_total,
    case
        when quantity > 0 then round(line_total / quantity, 2)
        else null
    end as effective_unit_price
from {{ source('raw', 'order_items') }}
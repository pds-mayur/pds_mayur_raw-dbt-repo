-- This file generates a Snowflake SQL compilation error because `PRODUCT_ID`
-- does not exist in `ECOMMERCE_DB.RAW.ORDER_ITEMS`.
-- Snowflake will usually report `invalid column name PRODUCT_ID`.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDER_ITEMS
)

select
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    line_total,
    PRODUCT_ID
from source_data

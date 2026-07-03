-- This file generates a Snowflake SQL compilation error because `discount_amount`
-- does not exist in `ECOMMERCE_DB.RAW.ORDER_ITEMS`.
-- Snowflake will usually report `invalid column name DISCOUNT_AMOUNT`.
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
    discount_amount
from source_data


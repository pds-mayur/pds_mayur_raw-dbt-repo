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
    discount_amount,
    NULLIF(quantity, 0) as safe_quantity
from source_data
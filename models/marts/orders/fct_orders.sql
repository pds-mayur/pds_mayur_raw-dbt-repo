with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    ORDER_DATE,
    status
from source_data

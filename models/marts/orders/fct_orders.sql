with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    order_date,
    STATUS
from source_data

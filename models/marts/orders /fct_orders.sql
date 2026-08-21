with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    order_date,
    staus
from source_data

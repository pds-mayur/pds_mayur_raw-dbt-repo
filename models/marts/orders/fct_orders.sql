with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    orderdate,
    status
from source_data

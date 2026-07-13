with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customerid,
    order_date,
    status
from source_data

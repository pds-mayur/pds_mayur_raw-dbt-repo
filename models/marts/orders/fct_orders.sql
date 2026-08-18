with source_data as (
    select *
    from ECOMRCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    order_date,
    status
from source_data

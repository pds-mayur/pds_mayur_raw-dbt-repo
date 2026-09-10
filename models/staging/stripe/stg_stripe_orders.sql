with source_data as (
    select *
    from AIE_TEST.public.ORDERS
)

select
    order_id,
    customer_id,
    order_date,
    status
from source_data

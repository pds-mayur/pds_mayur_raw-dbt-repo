with source_data as (
    select *
    from FIVETRAN_TEST.public.ORDERS
)

select
    order_id,
    customer_id,
    order_date
from source_data

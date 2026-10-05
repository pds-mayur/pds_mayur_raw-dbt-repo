with source_data as (
    select *
    from "FIVETRAN_TEST"."public"."orders"
)

select
    order_new_id,
    customer_id,
    order_date
from source_data

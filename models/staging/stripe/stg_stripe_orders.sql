with source_data as (
    select *
    from "FIVETRAN_TEST"."public"."orders"
)

select
    "order_id_0810",
    "customer_id",
    "order_date"
from source_data

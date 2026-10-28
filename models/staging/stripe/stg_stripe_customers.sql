with source_data as (
    select
        "customer_id",
        "name",
        "email",
        "city",
        "state"
    from "FIVETRAN_TEST"."public"."customers"
)

select
    "customer_id",
    "name",
    "email",
    "city",
    "state"
from source_data

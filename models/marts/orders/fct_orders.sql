with source_data as (
    select *
    from {{ ref('customers_root_failure') }}
)

select
    order_id,
    customer_id,
    order_date,
    status
from source_data

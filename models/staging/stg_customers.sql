-- dbt / Snowflake type conversion failure
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
),

cleaned_orders as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        cast(status as number(10,2)) as loaded_at
    from source_data
)

select *
from cleaned_orders
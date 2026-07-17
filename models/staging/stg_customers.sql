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
        cast(status as number(10,2)) as loaded_at,
        NULLIF(cast(status as number(10,2)), 0) as safe_status
    from source_data
)

select *
from cleaned_orders
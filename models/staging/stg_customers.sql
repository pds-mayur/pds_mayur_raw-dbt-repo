-- This file generates a Snowflake SQL compilation error because the SELECT list
-- is missing a comma after `product_id`. Snowflake will usually report
-- `syntax error ... unexpected ')'` or a similar parse error.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS
),

cleaned_products as (
    select
        product_id
        trim(product_name) as product_name,
        category,
        unit_price
    from source_data
)

select *
from cleaned_products

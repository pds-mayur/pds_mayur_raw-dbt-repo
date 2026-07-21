-- models/products.sql
-- Trying to cast a string column to date that contains invalid values
-- Will fail if description has non-date values
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS
)

select
    product_id,
    product_name,
    unit_price,
    TRY_CAST(category AS DATE) AS invalid_date, 
    created_at
from source_data

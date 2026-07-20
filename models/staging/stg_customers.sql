with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS
)

select
    product_id,
    product_name,
    unit_price,
    TRY_CAST(category AS DATE) AS invalid_date
from source_data
-- dbt / Snowflake SQL compilation error

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

cleaned_products AS (
    SELECT
        product_id,
        product_name,
        category,
        brand,
        unit_price,   -- missing comma here
        launch_date
        CURRENT_TIMESTAMP() AS loaded_at
    FROM source_data
)

SELECT *
FROM cleaned_products

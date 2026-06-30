-- dbt / Snowflake null in non-nullable column

WITH source_data AS (
    SELECT
        NULL AS product_id,
        product_name
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT *
FROM source_data

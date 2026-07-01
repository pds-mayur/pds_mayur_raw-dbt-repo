-- dbt / Snowflake numeric value not recognized

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    category AS category_number
FROM source_data

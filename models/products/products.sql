-- dbt / Snowflake numeric value not recognized

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    CAST(category AS NUMBER) AS category_number
FROM source_data

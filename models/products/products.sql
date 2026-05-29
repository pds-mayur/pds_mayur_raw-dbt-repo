-- dbt / Snowflake object does not exist

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT *
FROM source_data

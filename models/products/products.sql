-- dbt / Snowflake unsupported subquery

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.Products
)

SELECT *
FROM source_data s
WHERE EXISTS (
    SELECT COUNT(*)
)

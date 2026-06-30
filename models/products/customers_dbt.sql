{{ config(materialized='table') }}

SELECT
    *,
    CAST('abc' AS NUMBER) AS runtime_error
FROM RAW_DB.RAW_SCHEMA.CUSTOMERS

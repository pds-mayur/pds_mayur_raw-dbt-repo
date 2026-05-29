{{ config(materialized='table') }}

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    SUM(product_name) AS total
FROM source_data

{{ config(
    materialized='incremental',
    unique_key='product_id'
) }}

WITH duplicated_data AS (

    SELECT
        product_id,
        product_name
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS

    UNION ALL

    SELECT
        product_id,
        product_name
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT *
FROM duplicated_data

{{ config(
    materialized='incremental',
    unique_key='product_id'
) }}

WITH duplicated_customers AS (

    SELECT
        product_id,
        product_NAME
    FROM RAW_DB.RAW_SCHEMA.products

    UNION ALL

    SELECT
        product_id,
        product_NAME
    FROM RAW_DB.RAW_SCHEMA.products
)

SELECT *
FROM duplicated_products

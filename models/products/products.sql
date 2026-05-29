{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

WITH duplicated_customers AS (

    SELECT
        customer_id,
        customer_name
    FROM RAW_DB.RAW_SCHEMA.CUSTOMERS

    UNION ALL

    SELECT
        customer_id,
        customer_name
    FROM RAW_DB.RAW_SCHEMA.CUSTOMERS
)

SELECT *
FROM duplicated_customers

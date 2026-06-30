{{ config(materialized='table') }}

WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.CUSTOMERS
),

cleaned_customers AS (
    SELECT
        customer_id,
        TRIM(customer_name) AS customer_name,
        UPPER(customer_type) AS customer_type,
        INITCAP(brand) AS brand,
        CAST(unit_price AS NUMBER(10,2)) AS unit_price,
        CAST(launch_date AS DATE) AS launch_date,
        TO_NUMBER(customer_name) AS runtime_error
    FROM source_data
)

SELECT *
FROM cleaned_customers

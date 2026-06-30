WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.CUSTOMERS
),

cleaned_customers AS (
    SELECT
        customer_id,
        TRIM(customer_name) AS customer_name,
        UPPER(customer_type) AS customer_type,
        TO_NUMBER(customer_name) AS runtime_error
    FROM source_data
)

SELECT *
FROM cleaned_customers

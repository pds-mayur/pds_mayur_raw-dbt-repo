-- dbt / Snowflake error: Ambiguous column reference
-- Common when joining multiple tables/CTEs that share columns without qualifying them in the SELECT clause.
WITH order_data AS (
    SELECT 
        order_id,
        customer_id,
        order_date,
        total_amount
    FROM RAW_DB.RAW_SCHEMA.ORDERS
),

customer_data AS (
    SELECT 
        customer_id,
        first_name,
        email
    FROM RAW_DB.RAW_SCHEMA.CUSTOMERS
),

joined_data AS (
    SELECT
        order_id,              -- Safe (unique to order_data)
        first_name,         -- Safe (unique to customer_data)
        order_date,            -- Safe (unique to order_data)
        total_amount,          -- Safe (unique to order_data)
        customer_id            -- ERROR: Ambiguous column customer_id exists in both order_data and customer_data!
    FROM order_data
    LEFT JOIN customer_data ON order_data.customer_id = customer_data.customer_id
)

SELECT *
FROM joined_data

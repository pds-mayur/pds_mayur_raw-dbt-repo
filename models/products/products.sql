-- dbt / Snowflake ambiguous column error

WITH orders_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.ORDER_ITEMS
),

products_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT
    product_id,
    quantity,
    product_name
FROM orders_data od
JOIN products_data pd
    ON od.product_id = pd.product_id

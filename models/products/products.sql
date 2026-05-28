-- dbt / Snowflake error: Window function not allowed in WHERE clause
-- Common when attempting to filter based on window function ranking directly in the WHERE clause instead of inside a CTE.
WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

ranked_products AS (
    SELECT
        product_id,
        product_name,
        category,
        unit_price,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY unit_price DESC) AS price_rank
    FROM source_data
)

SELECT *
FROM ranked_products
WHERE price_rank = 1

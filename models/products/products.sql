-- dbt / Snowflake error: Not a group by expression
-- Common when aggregating metrics (e.g. SUM, AVG) but forgetting to group by non-aggregated dimensions.
WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

aggregated_products AS (
    SELECT
        category,
        brand,
        AVG(unit_price) AS average_price,
        COUNT(product_id) AS total_products
    FROM source_data
    GROUP BY category, brand
)

SELECT *
FROM aggregated_products

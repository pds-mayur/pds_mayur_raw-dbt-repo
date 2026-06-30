# Incident remediation: `6cbe4ebc-36a0-4b65-9d8a-cf22853f4e78`

## RCA summary
The SQL query in the 'products' model incorrectly places a window function in the WHERE clause, which is not allowed in SQL.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- manual_review_required
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/products/products.sql`
_Move the window function into the SELECT clause and filter in the CTE._

```
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
```

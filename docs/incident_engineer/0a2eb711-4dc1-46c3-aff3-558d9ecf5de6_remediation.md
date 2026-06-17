# Incident remediation: `0a2eb711-4dc1-46c3-aff3-558d9ecf5de6`

## RCA summary
Missing GROUP BY clause for non-aggregated dimensions in SQL query.

## Confidence score
0.95

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/products/products.sql`
_Add GROUP BY clause for non-aggregated dimensions._

```
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
```

# Incident remediation: `ef849daa-a869-455a-8314-7347269b1bbb`

## RCA summary
The SQL query in the 'products' model is missing a GROUP BY clause for non-aggregated dimensions, specifically 'category' and 'brand'.

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
_Add GROUP BY clause for non-aggregated dimensions 'category' and 'brand'._

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

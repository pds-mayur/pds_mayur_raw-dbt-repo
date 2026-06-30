# Incident remediation: `a35dfabe-5360-41cf-80b4-8a3f22b345f1`

## RCA summary
Division by zero in the SQL query used in the products model.

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
_Fix division by zero error by replacing the expression with a valid column reference._

```
-- dbt / Snowflake runtime error: division by zero
WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

cleaned_products AS (
    SELECT
        product_id,
        TRIM(product_name) AS product_name,
        UPPER(category) AS category,
        INITCAP(brand) AS brand,
        CAST(unit_price AS NUMBER(10,2)) AS unit_price,
        CAST(launch_date AS DATE) AS launch_date,
        loaded_at AS loaded_at
    FROM source_data
)

SELECT *
FROM cleaned_products
```

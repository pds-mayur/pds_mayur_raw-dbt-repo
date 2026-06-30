# Incident remediation: `461ccd0f-f2fa-4f5b-9cd4-acedad7b84d9`

## RCA summary
Division by zero in the SQL query due to the expression '1 / 0' in the cleaned_products CTE.

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
_Fix division by zero error in loaded_at calculation._

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
        NULL AS loaded_at
    FROM source_data
)

SELECT *
FROM cleaned_products
```

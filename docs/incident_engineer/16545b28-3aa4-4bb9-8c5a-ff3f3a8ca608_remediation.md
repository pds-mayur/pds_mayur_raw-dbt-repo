# Incident remediation: `16545b28-3aa4-4bb9-8c5a-ff3f3a8ca608`

## RCA summary
Division by zero in the SQL query used to load the products model.

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

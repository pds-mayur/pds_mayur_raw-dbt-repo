# Incident remediation: `a478c1b0-c048-4e06-8a3e-85ec00d35f68`

## RCA summary
Type conversion failure due to an invalid numeric value 'NOT_A_NUMBER' in the SQL query.

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
_Fix type conversion failure by replacing invalid numeric value_

```
-- dbt / Snowflake type conversion failure
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
        NULL AS unit_price,
        CAST(launch_date AS DATE) AS launch_date,
        CURRENT_TIMESTAMP() AS loaded_at
    FROM source_data
)

SELECT *
FROM cleaned_products
```

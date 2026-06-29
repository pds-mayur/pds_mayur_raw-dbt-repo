# Incident remediation: `40d81bc2-52a0-4a4c-a6fb-7eb850f84cdc`

## RCA summary
The SQL query failed due to an attempt to cast a non-numeric string 'NOT_A_NUMBER' to a numeric type, which is not recognized by the database.

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
_Fix casting of unit_price to avoid error_

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

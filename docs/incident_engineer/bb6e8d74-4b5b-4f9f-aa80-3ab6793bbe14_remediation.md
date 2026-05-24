# Incident remediation: `bb6e8d74-4b5b-4f9f-aa80-3ab6793bbe14`

## RCA summary
The SQL compilation error is due to the use of an invalid identifier 'PRODUCTNAME' in the SQL query.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/products/products.sql`
_Fix invalid identifier 'PRODUCTNAME' to 'product_name'_

```
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
        CURRENT_TIMESTAMP() AS loaded_at

    FROM source_data
)

SELECT *
FROM cleaned_products
```

# Incident remediation: `edc03fab-230f-4bb7-8761-383d2e05f173`

## RCA summary
The SQL compilation error is due to an invalid identifier 'CATEGARY', which is likely a typo for 'CATEGORY'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- manual_review_required
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/products/products.sql`
_Update models/products/products.sql to use Snowflake column 'CATEGORY' for failed model 'products' (Snowflake type: TEXT)._

```
WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

cleaned_products AS (
    SELECT
        product_id,
        TRIM(product_name) AS product_name,
        UPPER(CATEGORY) AS category,
        INITCAP(brand) AS brand,
        CAST(unit_price AS NUMBER(10,2)) AS unit_price,
        CAST(launch_date AS DATE) AS launch_date,
        CURRENT_TIMESTAMP() AS loaded_at

    FROM source_data
)

SELECT *
FROM cleaned_products
```

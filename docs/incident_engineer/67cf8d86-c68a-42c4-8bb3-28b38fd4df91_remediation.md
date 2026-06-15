# Incident remediation: `67cf8d86-c68a-42c4-8bb3-28b38fd4df91`

## RCA summary
The SQL compilation error is caused by an invalid identifier 'PRODUCTNAME', which does not match the expected column name 'PRODUCT_NAME' in the source table.

## Confidence score
0.95

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/products/products.sql`
_Update models/products/products.sql to use Snowflake column 'PRODUCT_NAME' for failed model 'products' (Snowflake type: TEXT)._

```
-- dbt / Snowflake runtime error: division by zero
WITH source_data AS (
    SELECT *
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
),

cleaned_products AS (
    SELECT
        product_id,
        TRIM(PRODUCT_NAME) AS product_name,
        UPPER(category) AS category,
        INITCAP(brand) AS brand,
        CAST(unit_price AS NUMBER(10,2)) AS unit_price,
        CAST(launch_date AS DATE) AS launch_date,
    FROM source_data
)

SELECT *
FROM cleaned_products
```

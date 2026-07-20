# Incident remediation: `b0c92a6f-3b6f-47d1-a7f0-c9c05d812769`

## RCA summary
invalid identifier 'CREATED_AT'

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

### Patch 1: `models/staging/stg_customers.sql`
_Remove invalid column 'CREATED_AT' from models/staging/stg_customers.sql for failed model 'stg_customers'_

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS
)

select
    product_id,
    product_name,
    unit_price,
    TRY_CAST(category AS DATE) AS invalid_date
from source_data
```

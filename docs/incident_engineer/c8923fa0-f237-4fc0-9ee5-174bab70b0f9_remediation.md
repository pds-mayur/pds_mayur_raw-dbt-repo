# Incident remediation: `c8923fa0-f237-4fc0-9ee5-174bab70b0f9`

## RCA summary
Division by zero error in SQL query

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

### Patch 1: `models/staging/stg_customers.sql`
_Guard divisor to prevent division by zero error._

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS_XYZ
)

select *
from source_data
```

# Incident remediation: `7b25729f-3f64-40d8-af17-a3d8a28f927e`

## RCA summary
The SQL compilation error occurred because the object 'ECOMMERCE_DB.RAW.CUSTOMERS_MISSING' does not exist or the user is not authorized to access it.

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
_Update reference to existing table CUSTOMERS in RAW schema._

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)

select *
from source_data
```

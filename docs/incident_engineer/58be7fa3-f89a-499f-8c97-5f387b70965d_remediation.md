# Incident remediation: `58be7fa3-f89a-499f-8c97-5f387b70965d`

## RCA summary
Duplicate row detected during DML action in the stg_customers model.

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
_Fix duplicate row issue by ensuring unique selection._

```
with source_data as (
    select distinct *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customerid,
    order_date,
    status
from source_data
```

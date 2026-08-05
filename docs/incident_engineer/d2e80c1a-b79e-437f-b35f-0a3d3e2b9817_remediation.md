# Incident remediation: `d2e80c1a-b79e-437f-b35f-0a3d3e2b9817`

## RCA summary
SQL compilation error due to invalid identifier 'CUSTOMERID'

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
_Update models/staging/stg_customers.sql to use Snowflake column 'CUSTOMER_ID' for failed model 'stg_customers' (Snowflake type: NUMBER)._

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    CUSTOMER_ID,
    order_date,
    status
from source_data
```

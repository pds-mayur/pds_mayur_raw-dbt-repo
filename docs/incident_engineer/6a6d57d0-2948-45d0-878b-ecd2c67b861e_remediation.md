# Incident remediation: `6a6d57d0-2948-45d0-878b-ecd2c67b861e`

## RCA summary
The identifier 'CUSTOMERID' is incorrectly spelled and does not match the expected 'CUSTOMER_ID'.

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

### Patch 1: `models/marts/orders/fct_orders.sql`
_Remove invalid column 'CUSTOMERID' from models/marts/orders/fct_orders.sql for failed model 'fct_orders'_

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    order_date,
    status
from source_data
```

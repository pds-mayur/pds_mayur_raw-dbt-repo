# Incident remediation: `afee2d09-1807-46ba-814a-218198d6a6f0`

## RCA summary
The identifier 'CUSTOMERID' is invalid due to case sensitivity in Snowflake.

## Confidence score
0.75

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

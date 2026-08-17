# Incident remediation: `decision-code-fix-001`

## RCA summary
The SQL query references an invalid column name 'CUSTOMERID' instead of the correct 'CUSTOMER_ID'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
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
    from ECOMMERCE_DB.RAW.ORDE
)

select
    order_id,
    order_date,
    status
from source_data
```

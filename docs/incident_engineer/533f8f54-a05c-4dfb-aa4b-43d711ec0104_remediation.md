# Incident remediation: `533f8f54-a05c-4dfb-aa4b-43d711ec0104`

## RCA summary
The SQL query references an invalid column name 'CUSTOMERID' instead of the correct 'CUSTOMER_ID'.

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
_Update models/marts/orders/fct_orders.sql to use Snowflake column 'CUSTOMER_ID' for failed model 'fct_orders' (Snowflake type: NUMBER)._

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

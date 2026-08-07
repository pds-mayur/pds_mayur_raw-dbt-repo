# Incident remediation: `bc7f5970-778a-41d3-a9dc-fe7d7686db1a`

## RCA summary
SQL compilation error due to invalid identifier 'CUSTOMERID'

## Confidence score
1.0

## Validation
- Patch scope validated: **True**

### Recommended steps
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

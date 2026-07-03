# Incident remediation: `98e2dba0-966c-46f5-84bb-05748ad025ad`

## RCA summary
The SQL compilation error occurred due to the use of an invalid identifier 'DISCOUNT_AMOUNT' in the query, which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

## Confidence score
0.95

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/staging/stg_customers.sql`
_Remove invalid column reference 'DISCOUNT_AMOUNT' from models/staging/stg_customers.sql for failed model 'stg_customers'_

```
-- This file generates a Snowflake SQL compilation error because `discount_amount`
-- does not exist in `ECOMMERCE_DB.RAW.ORDER_ITEMS`.
-- Snowflake will usually report `invalid column name DISCOUNT_AMOUNT`.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDER_ITEMS
)

select
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    line_total
from source_data
```

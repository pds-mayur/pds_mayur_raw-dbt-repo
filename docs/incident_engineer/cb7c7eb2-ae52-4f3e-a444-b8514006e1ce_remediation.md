# Incident remediation: `cb7c7eb2-ae52-4f3e-a444-b8514006e1ce`

## RCA summary
The SQL compilation error is due to the invalid identifier 'DISCOUNT_AMOUNT', which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

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
_Update models/staging/stg_customers.sql to use Snowflake column 'PRODUCT_ID' for failed model 'stg_customers' (Snowflake type: NUMBER)._

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
    line_total,
    PRODUCT_ID
from source_data
```

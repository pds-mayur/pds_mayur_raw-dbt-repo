# Incident remediation: `082f1ccb-faed-4903-bda6-440170e3e2f1`

## RCA summary
invalid identifier 'DISCOUNT_AMOUNT'

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
_Remove invalid column 'DISCOUNT_AMOUNT' from models/staging/stg_customers.sql for failed model 'stg_customers'_

```
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

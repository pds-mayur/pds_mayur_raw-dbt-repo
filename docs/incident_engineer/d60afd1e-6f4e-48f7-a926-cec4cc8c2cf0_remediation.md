# Incident remediation: `d60afd1e-6f4e-48f7-a926-cec4cc8c2cf0`

## RCA summary
Division by zero error in SQL query

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
_Guard the divisor to prevent division by zero errors._

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
    line_total,
    discount_amount,
    NULLIF(quantity, 0) as safe_quantity
from source_data
```

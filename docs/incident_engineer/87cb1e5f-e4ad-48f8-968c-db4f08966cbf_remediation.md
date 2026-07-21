# Incident remediation: `87cb1e5f-e4ad-48f8-968c-db4f08966cbf`

## RCA summary
Deterministic RCA indicates a 'missing column' incident on stg_customers. Estimated impacted assets: 1. Primary dbt error: Database Error in model stg_customers (models/staging/stg_customers.sql). Error details: 000904 (42000): SQL compilation error: error line 19 at position 4 | invalid identifier 'DISCOUNT_AMOUNT' | compiled code at target/run/real_time_project/models/staging/stg_customers.sql. Repo manifest indexes 1 models.

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

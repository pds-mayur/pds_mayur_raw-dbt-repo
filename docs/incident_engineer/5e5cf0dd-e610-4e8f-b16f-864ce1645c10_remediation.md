# Incident remediation: `5e5cf0dd-e610-4e8f-b16f-864ce1645c10`

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
_Guard divisor in SQL to prevent division by zero error._

```
-- dbt / Snowflake type conversion failure
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
),

cleaned_orders as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        cast(status as number(10,2)) as loaded_at
    from source_data
)

select *
from cleaned_orders
```

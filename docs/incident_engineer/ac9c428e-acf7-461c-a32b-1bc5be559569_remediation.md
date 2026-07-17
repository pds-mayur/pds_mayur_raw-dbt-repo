# Incident remediation: `ac9c428e-acf7-461c-a32b-1bc5be559569`

## RCA summary
Division by zero error in the SQL query

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
_Guard divisor to prevent division by zero error._

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

# Incident remediation: `8414580f-75ee-4eb7-a55e-eed0bb7ddd30`

## RCA summary
Division by zero in SQL query

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Unhandled dbt error needs review
Target file: `models/staging/stg_customers.sql`

The current project rules do not have a confident automated fix for this failure. No automatic SQL patch was generated. Review the full dbt run result, compiled SQL, and live Snowflake context, then patch only after the root cause is confirmed. Primary dbt error: Division by zero | select * from ecommerce_db.dbt_170726.stg_customers;.


### Possible reviewed patches

#### Review the current model SQL
Use this as the starting point for a human-reviewed fix; no automatic SQL edit was considered safe.
```sql
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customer_id,
    order_date,
    status,
    1 / 0 AS loaded_at
from source_data
```

## Proposed patches

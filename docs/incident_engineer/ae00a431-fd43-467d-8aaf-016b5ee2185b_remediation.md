# Incident remediation: `ae00a431-fd43-467d-8aaf-016b5ee2185b`

## RCA summary
The model fct_orders is referencing a non-existent or unauthorized object 'ECOMMERCE_DB.RAW.CUSTOMERS_MISSING'.

## Confidence score
0.75

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
Target file: `models/marts/orders/fct_orders.sql`

The current project rules do not have a confident automated fix for this failure. No automatic SQL patch was generated. Review the full dbt run result, compiled SQL, and live Snowflake context, then patch only after the root cause is confirmed. Primary dbt error: Database Error in model fct_orders (models/marts/orders/fct_orders.sql) | 002003 (42S02): SQL compilation error: | Object 'ECOMMERCE_DB.RAW.CUSTOMERS_MISSING' does not exist or not authorized. | compiled code at target/run/pipelinewerks/models/marts/orders/fct_orders.sql.

```sql
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS_MISSING
)

select *
from source_data
```

### Possible reviewed patches

#### Review the current model SQL
Use this as the starting point for a human-reviewed fix; no automatic SQL edit was considered safe.
```sql
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS_MISSING
)

select *
from source_data
```

## Proposed patches

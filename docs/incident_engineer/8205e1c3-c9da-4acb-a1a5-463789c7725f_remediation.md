# Incident remediation: `8205e1c3-c9da-4acb-a1a5-463789c7725f`

## RCA summary
The SQL compilation error occurred because the specified warehouse 'NON_EXISTENT_WH' does not exist or is not accessible.

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
_The specified warehouse 'NON_EXISTENT_WH' does not exist. Change to 'COMPUTE_WH' which is the available warehouse but currently suspended._

```
-- models/staging/stg_customers_missing.sql
{{
  config(
    warehouse='COMPUTE_WH',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE COMPUTE_WH") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
```

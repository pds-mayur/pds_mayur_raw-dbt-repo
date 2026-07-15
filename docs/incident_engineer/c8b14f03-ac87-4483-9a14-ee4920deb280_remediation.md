# Incident remediation: `c8b14f03-ac87-4483-9a14-ee4920deb280`

## RCA summary
The SQL compilation error occurred due to a reference to a non-existent warehouse ('NON_EXISTENT_WH') in the model 'stg_customers'.

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
_Update warehouse reference to a valid warehouse._

```
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

# Incident remediation: `4e96c2ad-0cf7-4f2d-adf8-cc452d7f6b6e`

## RCA summary
The SQL compilation error occurred due to an attempt to use a non-existent warehouse ('NON_EXISTENT_WH') in the model 'stg_customers'.

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
_Update the warehouse configuration to a valid warehouse._

```
{{
  config(
    warehouse='VALID_WAREHOUSE',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE VALID_WAREHOUSE") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
```

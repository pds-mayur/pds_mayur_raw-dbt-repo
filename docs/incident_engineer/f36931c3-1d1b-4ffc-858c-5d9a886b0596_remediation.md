# Incident remediation: `f36931c3-1d1b-4ffc-858c-5d9a886b0596`

## RCA summary
The warehouse 'COMPUTE_WH' was suspended, preventing the execution of the model 'stg_customers'.

## Confidence score
0.95

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/staging/stg_customers.sql`
_The warehouse 'COMPUTE_WH' is suspended. Please resume the warehouse before executing the model._

```
-- models/staging/stg_customers_missing.sql
{{ config(
    warehouse='NON_EXISTENT_WH',
    materialized='table'
) }}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
```

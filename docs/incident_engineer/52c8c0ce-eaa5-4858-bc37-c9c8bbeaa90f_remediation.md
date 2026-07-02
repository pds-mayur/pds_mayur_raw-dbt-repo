# Incident remediation: `52c8c0ce-eaa5-4858-bc37-c9c8bbeaa90f`

## RCA summary
Division by zero in the SQL query used to create the stg_customers model.

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
_Fix division by zero error in loaded_at calculation._

```
{{ config(materialized='view') }}

select
    cast(customer_id as number) as customer_id,  -- intentional typo
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state,
    null AS loaded_at
from {{ source('raw', 'customers') }}
```

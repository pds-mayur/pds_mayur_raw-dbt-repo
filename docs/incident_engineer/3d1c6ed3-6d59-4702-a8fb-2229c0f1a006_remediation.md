# Incident remediation: `3d1c6ed3-6d59-4702-a8fb-2229c0f1a006`

## RCA summary
Typographical error in the SQL code referencing 'CUSTMER_ID' instead of the correct identifier 'CUSTOMER_ID'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- manual_review_required
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/staging/stg_customers.sql`
_Remove invalid column 'CUSTMER_ID' from models/staging/stg_customers.sql for failed model 'stg_customers'_

```
{{ config(materialized='view') }}

select
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state
from {{ source('raw', 'customers') }}
```

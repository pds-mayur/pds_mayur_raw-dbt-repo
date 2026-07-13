# Incident remediation: `8d52b445-27ce-4985-8dbb-8d029faa4c17`

## RCA summary
Typographical error in the SQL query referencing 'CUSTMER_ID' instead of the correct identifier 'CUSTOMER_ID'.

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

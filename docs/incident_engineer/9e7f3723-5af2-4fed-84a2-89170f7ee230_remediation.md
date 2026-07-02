# Incident remediation: `9e7f3723-5af2-4fed-84a2-89170f7ee230`

## RCA summary
Typographical error in the SQL code where 'custmer_id' is incorrectly spelled instead of 'customer_id'.

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
_Update models/staging/stg_customers.sql to use Snowflake column 'CUSTOMER_ID' for failed model 'stg_customers' (Snowflake type: NUMBER)._

```
{{ config(materialized='view') }}

select
    cast(CUSTOMER_ID as number) as customer_id,  -- intentional typo
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state
from {{ source('raw', 'customers') }}
```

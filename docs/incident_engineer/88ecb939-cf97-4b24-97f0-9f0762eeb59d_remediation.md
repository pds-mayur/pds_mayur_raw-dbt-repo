# Incident remediation: `88ecb939-cf97-4b24-97f0-9f0762eeb59d`

## RCA summary
SQL syntax errors in the model definition for 'stg_customers'.

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
_Fix Snowflake stage FILE_FORMAT syntax in models/staging/stg_customers.sql._

```
SELECT
    $1,
    $2,
    $3
FROM @~/missing/customers_2025_01_01.csv
(FILE_FORMAT = (TYPE = CSV, SKIP_HEADER = 1));
```

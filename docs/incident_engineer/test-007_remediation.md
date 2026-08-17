# Incident remediation: `test-007`

## RCA summary
A Jinja variable used in the model 'stg_products' is undefined.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Unhandled dbt error needs review
Target file: `models/staging/stg_products.sql`

The current project rules do not have a confident automated fix for this failure. No automatic SQL patch was generated. Review the full dbt run result, compiled SQL, and live Snowflake context, then patch only after the root cause is confirmed. Primary dbt error: Compilation Error in model stg_products: jinja undefined variable.


## Proposed patches

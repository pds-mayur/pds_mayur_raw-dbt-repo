# Incident remediation: `a7b9ec48-024f-41f7-a58c-784855e84cb3`

## RCA summary
The dbt model 'dbt_run.sql' could not be found in the specified paths.

## Confidence score
0.75

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Unhandled dbt error needs review
Target file: `models/dbt_run.sql`

The current project rules do not have a confident automated fix for this failure. No automatic SQL patch was generated. Review the full dbt run result, compiled SQL, and live Snowflake context, then patch only after the root cause is confirmed. Primary dbt error: dbt command failed.


## Proposed patches

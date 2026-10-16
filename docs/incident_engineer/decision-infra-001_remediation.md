# Incident remediation: `decision-infra-001`

## RCA summary
The query exceeded the timeout threshold while executing against the warehouse TRANSFORM_WH.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Wrong Snowflake warehouse
Target file: `models/marts/large/fct_large_fact.sql`

The warehouse name 'TRANSFORM_WH' was not found in the verified Snowflake warehouse list. Update the dbt job, profile, or runtime target to a valid warehouse before retrying.


### Possible reviewed patches

#### Review query limits for Snowflake warehouse `TRANSFORM_WH`
Review warehouse sizing, concurrency, and query shape before retrying.

#### Review verified Snowflake warehouses
Use this live warehouse list to confirm the dbt job/profile target.
```sql
COMPUTE_WH
SNOWFLAKE_LEARNING_WH
SYSTEM$STREAMLIT_NOTEBOOK_WH
```

## Proposed patches

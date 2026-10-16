# Incident remediation: `348cdc55-0f5f-491b-8f57-b026ae3452cd`

## RCA summary
Deterministic RCA indicates a 'sql error' incident on AIE_Job. Estimated impacted assets: 1.

## Confidence score
0.92

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/AIE_Job.sql`
_Add review marker (no fetched SQL; path only)._

```
-- incident_engineer: review before merge — verify SQL/refs and warehouse error

-- TODO: add model SQL
```

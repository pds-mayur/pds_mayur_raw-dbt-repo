# Incident remediation: `060c70b5-1aab-41a7-81e1-2bfc392907a5`

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

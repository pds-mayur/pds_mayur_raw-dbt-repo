# Incident remediation: `f1db47b7-48a6-4ea9-b8a1-b8f31038318b`

## RCA summary
Deterministic RCA indicates a 'sql error' incident on New job AI_INcident. Estimated impacted assets: 1.

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

### Patch 1: `models/New job AI_INcident.sql`
_Add review marker (no fetched SQL; path only)._

```
-- incident_engineer: review before merge — verify SQL/refs and warehouse error

-- TODO: add model SQL
```

# Incident remediation: `37d94ab4-6c04-4b9f-b4a8-4493a11cad59`

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

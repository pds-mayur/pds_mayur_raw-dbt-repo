# Incident remediation: `81eaa913-47b2-4591-83db-7a8bb8ed01a0`

## RCA summary
Duplicate row detected during DML action in the stg_customers model.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

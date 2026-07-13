# Incident remediation: `d8a22e2e-f3b9-4d5b-ba25-714f426cff2c`

## RCA summary
Duplicate rows in the source data for the 'stg_customers' model during a DML action.

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

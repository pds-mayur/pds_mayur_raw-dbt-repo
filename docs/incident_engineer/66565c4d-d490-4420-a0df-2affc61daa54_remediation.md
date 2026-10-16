# Incident remediation: `66565c4d-d490-4420-a0df-2affc61daa54`

## RCA summary
Duplicate rows in the source data for the 'stg_customers' model caused a database error during the DML action.

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

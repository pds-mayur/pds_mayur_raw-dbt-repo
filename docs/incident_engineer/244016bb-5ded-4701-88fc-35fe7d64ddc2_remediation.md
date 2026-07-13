# Incident remediation: `244016bb-5ded-4701-88fc-35fe7d64ddc2`

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

# Incident remediation: `fae3ef2b-c78b-4eda-a1d8-be0562c7ff69`

## RCA summary
The SQL compilation error is due to an invalid identifier 'CUSTOMER_NAME' in the SQL query, indicating that this column does not exist in the source table 'CUSTOMERS'.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

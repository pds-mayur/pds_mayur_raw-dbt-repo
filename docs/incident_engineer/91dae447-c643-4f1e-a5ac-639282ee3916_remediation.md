# Incident remediation: `91dae447-c643-4f1e-a5ac-639282ee3916`

## RCA summary
The SQL query in the model 'stg_customers' references an invalid column 'DISCOUNT_AMOUNT' that does not exist in the 'ECOMMERCE_DB.RAW.ORDER_ITEMS' table.

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

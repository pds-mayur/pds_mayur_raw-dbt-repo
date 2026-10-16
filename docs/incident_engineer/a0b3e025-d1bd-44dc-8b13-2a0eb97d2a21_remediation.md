# Incident remediation: `a0b3e025-d1bd-44dc-8b13-2a0eb97d2a21`

## RCA summary
The SQL query in the model 'stg_customers' references an invalid identifier 'DISCOUNT_AMOUNT' which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

## Confidence score
0.95

## Validation
- Patch scope validated: **False**

### Recommended steps
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

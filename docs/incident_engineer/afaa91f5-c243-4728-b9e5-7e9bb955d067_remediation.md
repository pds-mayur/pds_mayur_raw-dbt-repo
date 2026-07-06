# Incident remediation: `afaa91f5-c243-4728-b9e5-7e9bb955d067`

## RCA summary
The SQL compilation error is caused by the reference to an invalid identifier 'DISCOUNT_AMOUNT' in the SQL query, which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

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

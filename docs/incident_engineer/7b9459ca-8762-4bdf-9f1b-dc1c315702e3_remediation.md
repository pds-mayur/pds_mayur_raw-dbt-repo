# Incident remediation: `7b9459ca-8762-4bdf-9f1b-dc1c315702e3`

## RCA summary
The SQL query in the stg_customers model references an invalid identifier 'DISCOUNT_AMOUNT', which does not exist in the source table ECOMMERCE_DB.RAW.ORDER_ITEMS.

## Confidence score
0.95

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/staging/stg_customers.sql`
_Remove invalid column reference 'DISCOUNT_AMOUNT' from models/staging/stg_customers.sql for failed model 'stg_customers'_

- Applied in the model SQL file; see the SQL diff in the PR.

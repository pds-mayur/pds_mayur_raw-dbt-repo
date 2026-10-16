# Incident remediation: `eef2acef-3ac0-401f-afd2-7147064cd264`

## RCA summary
The SQL compilation error is caused by the reference to an invalid identifier 'DISCOUNT_AMOUNT' in the SQL query, which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

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
_Remove invalid column 'DISCOUNT_AMOUNT' from models/staging/stg_customers.sql for failed model 'stg_customers'_
- Patch kind: `sql`
- Applied in the model SQL file; see the SQL/YAML diff in the PR for the exact line-level change.

# Incident remediation: `87e72e98-e120-40d7-a32a-e14cfdef9456`

## RCA summary
The SQL query references an invalid column name 'CUSTOMERID' instead of the correct 'CUSTOMER_ID'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- Review the generated PR diff
- Run dbt compile on the patched branch
- Run the affected model and relevant tests
- Merge the PR after validation passes

## Proposed patches

### Patch 1: `models/marts/orders/fct_orders.sql`
_Update invalid column reference in SQL query._

```diff
- customerid,
+ CUSTOMER_ID,
```

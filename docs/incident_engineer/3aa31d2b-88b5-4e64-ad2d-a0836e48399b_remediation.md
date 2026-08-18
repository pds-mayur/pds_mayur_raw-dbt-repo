# Incident remediation: `3aa31d2b-88b5-4e64-ad2d-a0836e48399b`

## RCA summary
The SQL query references an incorrect column name 'ORDERDATE' instead of the correct 'ORDER_DATE'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- Apply the fix to fct_orders.sql.
- Run dbt compile.
- Run affected model/tests.
- Create a PR for the changes.

## Proposed patches

### Patch 1: `models/marts/orders/fct_orders.sql`
_Correct column name from 'orderdate' to 'ORDER_DATE'._

```diff
- orderdate,
+ ORDER_DATE,
```

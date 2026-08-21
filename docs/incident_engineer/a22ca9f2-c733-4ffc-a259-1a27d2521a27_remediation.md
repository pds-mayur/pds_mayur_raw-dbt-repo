# Incident remediation: `a22ca9f2-c733-4ffc-a259-1a27d2521a27`

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
_Update the column reference from 'customerid' to 'CUSTOMER_ID'._

```diff
- customerid,
+ CUSTOMER_ID,
```

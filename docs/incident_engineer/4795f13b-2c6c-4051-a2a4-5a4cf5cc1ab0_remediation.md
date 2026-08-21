# Incident remediation: `4795f13b-2c6c-4051-a2a4-5a4cf5cc1ab0`

## RCA summary
The SQL query references an invalid column 'STATS' that does not exist in the 'ORDERS' table.

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
_Replace invalid column reference 'stats' with 'STATUS'._

```diff
- stats
+ STATUS
```

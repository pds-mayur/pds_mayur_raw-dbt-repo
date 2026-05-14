# Incident remediation: `e2e-demo-incident`

## RCA summary
Deterministic RCA indicates a 'missing column' incident on fct_orders. Estimated impacted assets: 1.

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

### Patch 1: `models/marts/schema.yml`
_Document and declare column 'CUSTOMER_ID' for model 'fct_orders' (warehouse may still need ALTER)._

```diff
--- a/models/marts/schema.yml
+++ b/models/marts/schema.yml
@@ -1,6 +1,11 @@
 version: 2
 models:
   - name: fct_orders
     columns:
       - name: CUSTOMER_ID
         description: "Added to resolve missing identifier / schema mismatch"
```

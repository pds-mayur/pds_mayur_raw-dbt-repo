# Incident remediation: `77fdad14-a93c-4dcc-8fb4-e3365e6be042`

## RCA summary
Database error due to unrecognized numeric value 'N/A' in the data being loaded.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- manual_review_required
- Review patches (max small diff policy)
- Apply locally or via draft PR only
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/load/schema.yml`
_Document and declare column 'ERP_ORDERS' for model 'load_erp_orders' (warehouse may still need ALTER)._

```diff
--- a/models/load/schema.yml
+++ b/models/load/schema.yml
@@ -1,6 +1,11 @@
 version: 2
 models:
   - name: load_erp_orders
     columns:
       - name: ERP_ORDERS
         description: "Added to resolve missing identifier / schema mismatch"
```

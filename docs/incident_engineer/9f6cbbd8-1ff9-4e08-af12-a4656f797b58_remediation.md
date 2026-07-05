# Incident remediation: `9f6cbbd8-1ff9-4e08-af12-a4656f797b58`

## RCA summary
The SQL compilation error is caused by the reference to an invalid identifier 'DISCOUNT_AMOUNT' in the query, which does not exist in the source table 'ECOMMERCE_DB.RAW.ORDER_ITEMS'.

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

```diff
--- a/models/staging/stg_customers.sql
+++ b/models/staging/stg_customers.sql
@@ -12,7 +12,5 @@
     product_id,
     quantity,
     unit_price,
-    line_total,
-    discount_amount
+    line_total
 from source_data
-
```

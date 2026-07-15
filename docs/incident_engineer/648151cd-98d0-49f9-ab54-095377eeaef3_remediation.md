# Incident remediation: `648151cd-98d0-49f9-ab54-095377eeaef3`

## RCA summary
The SQL compilation error indicates that the external stage 'ECOMMERCE_DB.RAW.MISSING_EXTERNAL_STAGE' does not exist or the user is not authorized to access it.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- manual_review_required
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Proposed patches

### Patch 1: `models/staging/stg_customers.sql`
_The external stage 'ECOMMERCE_DB.RAW.MISSING_EXTERNAL_STAGE' does not exist. Please verify the correct external stage name and update the SQL accordingly._

```
{{
  config(
    materialized='table'
  )
}}

{% do run_query("COPY INTO @ECOMMERCE_DB.RAW.CUSTOMERS_EXPORT_STAGE/customers_export.csv FROM (SELECT * FROM ECOMMERCE_DB.RAW.CUSTOMERS) FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY = '\"')") %}

select *
from ECOMMERCE_DB.RAW.CUSTOMERS
```

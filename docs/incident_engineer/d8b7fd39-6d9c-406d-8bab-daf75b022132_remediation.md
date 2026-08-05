# Incident remediation: `d8b7fd39-6d9c-406d-8bab-daf75b022132`

## RCA summary
Database error due to unrecognized numeric value 'N/A' in the data being loaded.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Numeric placeholder needs safe casting
Target file: `models/load/load_erp_orders.sql`

Snowflake rejected 'N/A' while loading ORDER_TOTAL. Preserve the raw source value, then normalize known placeholders to NULL with TRY_TO_NUMBER/NULLIF in a reviewed staging transformation. Avoid ON_ERROR=CONTINUE as the primary fix because it can silently skip records.

```sql
{{
    config(
        materialized='view',

        pre_hook=[
            "
            COPY INTO ECOMMERCE_DB.RAW.ERP_ORDERS
            FROM @ECOMMERCE_DB.RAW.ERP_STAGE/
            FILES = ('orders_2026_07_25_040000.csv.gz')
            FILE_FORMAT = (
                FORMAT_NAME = 'ECOMMERCE_DB.RAW.CSV_STANDARD'
            )
            ON_ERROR = 'ABORT_STATEMENT'
            FORCE = TRUE
            "
        ]
    )
}}

select
    current_timestamp() as load_attempted_at
```

### Possible reviewed patches

#### Safely normalize ORDER_TOTAL
Use this pattern where the project transforms raw ERP order values into typed columns.
```sql
order_total as order_total_raw,
try_to_number(nullif(trim(order_total), 'N/A')) as order_total
```

## Proposed patches

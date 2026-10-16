# Incident remediation: `e8b63bd4-f531-4a78-bfdd-378ec86bdaf6`

## RCA summary
Duplicate rows in the source data for the 'stg_customers' model caused a database error during the DML action.

## Why this happened
- Manual dbt/SQL remediation required
- No SQL file was patched because duplicate rows were detected during an incremental dbt DML action and the provided SQL context did not produce a safe minimal deduplication patch. Review the dbt error and model SQL together, then apply only a correction that is confirmed by the project context.

## Confidence score
0.9

## Validation
- Patch scope validated: **False**

### Recommended steps
- manual_review_required
- Review patches on draft PR branch
- Run dbt build --select affected_model
- Do not auto-merge

## Suggested correction for review

### Manual dbt/SQL remediation required
Target file: `models/staging/stg_customers.sql`

No SQL file was patched because duplicate rows were detected during an incremental dbt DML action and the provided SQL context did not produce a safe minimal deduplication patch. Review the dbt error and model SQL together, then apply only a correction that is confirmed by the project context.


### Possible reviewed patches

#### Review the current model SQL
Use this as the starting point for a human-reviewed fix; no automatic SQL edit was considered safe.
```sql
-- models/staging/stg_orders_merge_error.sql
{{
  config(
    materialized='incremental',
    unique_key='order_id',
    warehouse='COMPUTE_WH'
  )
}}

with source_data as (
    -- Create duplicates intentionally
    select 
        order_id,
        customer_id,
        order_date,
        status,
        row_number() over (partition by order_id order by order_date) as rn
    from ECOMMERCE_DB.RAW.ORDERS
    
    UNION ALL
    
    -- Add duplicate records with different data
    select 
        order_id,
        customer_id,
        order_date,
        'DUPLICATE_STATUS' as status,
        2 as rn
    from ECOMMERCE_DB.RAW.ORDERS
    where order_id in (select order_id from ECOMMERCE_DB.RAW.ORDERS limit 10)
)
select 
    order_id,
    customer_id,
    order_date,
    status
from source_data
-- This will have multiple rows with same order_id
```

#### LLM suggested sql patch for review
Remove intentional duplicates to prevent DML errors.
```sql
-- models/staging/stg_orders_merge_error.sql
{{
  config(
    materialized='incremental',
    unique_key='order_id',
    warehouse='COMPUTE_WH'
  )
}}

with source_data as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from ECOMMERCE_DB.RAW.ORDERS

    -- Removed UNION ALL to prevent duplicates
)
select
    order_id,
    customer_id,
    order_date,
    status
from source_data
```

## Proposed patches

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

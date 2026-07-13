-- models/error_warehouse_suspended.sql
{{ config(
    warehouse='COMPUTE_WH',
    materialized='table'  -- Forces data to be read
) }}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data

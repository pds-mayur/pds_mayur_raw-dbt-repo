-- models/staging/stg_customers_missing.sql
{{ config(
    warehouse='NON_EXISTENT_WH',
    materialized='table'
) }}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
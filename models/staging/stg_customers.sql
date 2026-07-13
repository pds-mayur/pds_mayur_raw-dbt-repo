-- models/staging/stg_customers_missing.sql
{{
  config(
    warehouse='NON_EXISTENT_WH',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE NON_EXISTENT_WH") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data

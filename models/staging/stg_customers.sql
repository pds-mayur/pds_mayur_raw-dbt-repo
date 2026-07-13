-- models/staging/stg_customers.sql
{{
  config(
    warehouse='DBT_WAREHOUSE',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE DBT_WAREHOUSE") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
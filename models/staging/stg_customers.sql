-- models/staging/stg_customers.sql
{{
  config(
    warehouse='DBT_WH',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE DBT_WH") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
{{
  config(
    warehouse='VALID_WAREHOUSE',
    materialized='table'
  )
}}

-- Force the warehouse switch
{% do run_query("USE WAREHOUSE VALID_WAREHOUSE") %}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
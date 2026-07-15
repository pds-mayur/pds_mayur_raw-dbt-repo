{{
  config(
    warehouse='YOUR_EXISTING_WAREHOUSE',
    materialized='table'
  )
}}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)
select *
from source_data
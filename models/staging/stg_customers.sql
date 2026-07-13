{{ config(
    warehouse='COMPUTE_WH',
    materialized='table'
) }}

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
    cross join ECOMMERCE_DB.RAW.CUSTOMERS c2
    cross join ECOMMERCE_DB.RAW.CUSTOMERS c3
)
select *
from source_data

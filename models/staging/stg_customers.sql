-- models/staging/stg_customers_exceed.sql
{{ config(
    warehouse='COMPUTE_WH',
    materialized='table'
) }}

with recursive numbers as (
    select 1 as n
    union all
    select n + 1 from numbers where n < 10000000
)
select 
    s.*,
    n
from ECOMMERCE_DB.RAW.CUSTOMERS s
cross join numbers

-- models/staging/stg_customers_insufficient.sql
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
select 
    s.*,
    c2.CUSTOMER_ID as c2_id,
    c3.CUSTOMER_ID as c3_id
from ECOMMERCE_DB.RAW.CUSTOMERS s
cross join ECOMMERCE_DB.RAW.CUSTOMERS c2
cross join ECOMMERCE_DB.RAW.CUSTOMERS c3

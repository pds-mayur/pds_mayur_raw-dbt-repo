{{ config(materialized='table') }}

select
    null as order_id,
    customerid,
    order_date,
    status
from {{ source('raw', 'orders') }}
limit 128

{{ config(materialized='view') }}

select
    cast(order_id as number) as order_id,
    cast(customer_id as number) as customer_id,
    cast(order_date as date) as order_date,
    upper(trim(status)) as order_status,
    date_trunc('month', cast(order_date as date)) as order_month
from {{ source('raw', 'orders') }}
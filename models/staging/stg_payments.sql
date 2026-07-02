{{ config(materialized='view') }}

select
    cast(payment_id as number) as payment_id,
    cast(order_id as number) as order_id,
    upper(trim(payment_method)) as payment_method,
    cast(amount as number(18,2)) as amount,
    upper(trim(payment_status)) as payment_status,
    case
        when upper(trim(payment_status)) = 'PAID' then 1
        else 0
    end as is_paid
from {{ source('raw', 'payments') }}
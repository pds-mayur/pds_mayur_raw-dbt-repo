{{ config(materialized='view') }}

select
    cast(customer_id as number) as customer_id,
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state,
    case
        when email ilike '%@gmail.com' then 'Gmail'
        when email ilike '%@yahoo.com' then 'Yahoo'
        when email ilike '%@outlook.com' then 'Outlook'
        when email ilike '%@icloud.com' then 'iCloud'
        else 'Other'
    end as email_provider
from {{ source('raw', 'customers') }}
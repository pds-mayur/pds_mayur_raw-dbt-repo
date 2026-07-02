{{ config(materialized='view') }}

select
    cast(customer_id as number) as customer_id,  -- intentional typo
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state,
    1 / 0 AS loaded_at
from {{ source('raw', 'customers') }}

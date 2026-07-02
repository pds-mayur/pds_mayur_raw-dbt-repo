{{ config(materialized='view') }}

select
    cast(CUSTOMER_ID as number) as customer_id,  -- intentional typo
    trim(name) as customer_name,
    lower(trim(email)) as email,
    initcap(trim(city)) as city,
    upper(trim(state)) as state
from {{ source('raw', 'customers') }}
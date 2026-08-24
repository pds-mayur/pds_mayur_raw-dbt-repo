{{ config(materialized='view') }}

with source_data as (

    select *
    from {{ source('stripe', 'orders') }}

)

select *
from source_data

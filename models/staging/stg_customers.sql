with source_data as (
    select *
    from MISSING_DB.RAW.PAYMENTS
)

select *
from source_data

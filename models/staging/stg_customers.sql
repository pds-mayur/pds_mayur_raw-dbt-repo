-- This file generates a Snowflake SQL compilation error because the SELECT list
-- contains an incomplete expression before `FROM`. Snowflake reports
-- `unexpected 'FROM'`.

with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS
)

select
    customer_id,
    name
from source_data;
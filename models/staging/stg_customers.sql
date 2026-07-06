-- This file generates a Snowflake SQL compilation error because `customerid`
-- is not a valid column name in `ECOMMERCE_DB.RAW.ORDERS`.
-- The real column is `CUSTOMER_ID`, so Snowflake will usually report
-- `invalid identifier CUSTOMERID`.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    customerid as customer_id,
    order_date,
    status
from source_data

-- Correct SQL:
-- replace the invalid identifier with the real column name from the source.
-- with source_data as (
--     select *
--     from ECOMMERCE_DB.RAW.ORDERS
-- )
--
-- select
--     order_id,
--     customer_id,
--     order_date,
--     status
-- from source_data

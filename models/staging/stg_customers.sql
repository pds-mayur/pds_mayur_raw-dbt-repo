-- This file generates a Snowflake SQL compilation error because the referenced
-- object does not exist.
-- Snowflake will usually report `object does not exist`.
-- Possible reasons: upstream model failed, wrong database, wrong schema,
-- or the object was dropped.
-- AI can: detect dependency, rebuild upstream, suggest correct schema.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.CUSTOMERS_MISSING
)

select *
from source_data

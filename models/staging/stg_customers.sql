-- This file generates a Snowflake SQL compilation error because the target
-- table XYZ does not exist.
-- Expected snippet: table_xyz.
-- Snowflake will usually report `table XYZ does not exist`.
-- Possible reasons: upstream model failed, wrong database, wrong schema,
-- or the object was dropped.
-- AI can: detect dependency, rebuild upstream, suggest correct schema.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.PRODUCTS_XYZ
)

select *
from source_data

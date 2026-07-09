-- This file generates a Snowflake SQL compilation error because the target
-- table XYZ does not exist.
-- Expected snippet: table_xyz.
-- Snowflake will usually report `table XYZ does not exist`.
-- Possible reasons: upstream model failed, wrong database, wrong schema,
-- or the object was dropped.
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.table_xyz -- Updated to indicate the correct table name
)

select *
from source_data
-- This file generates a dbt compilation error caused by an undefined Jinja variable.
-- Expected dbt message: Undefined variable.
-- Cause: missing variable in the Jinja context.
-- AI fix: excellent candidate.
--
-- The Jinja expression below is intentionally invalid so dbt fails before SQL
-- reaches Snowflake.
select
    customer_id,
    order_id,
    {{ missing_var }} as problematic_value
from ECOMMERCE_DB.RAW.ORDERS

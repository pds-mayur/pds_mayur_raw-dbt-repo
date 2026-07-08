-- This file generates a dbt compilation error because `env` is undefined.
-- Expected dbt message: `'env' is undefined`.
-- Expected snippet: env is undefined.
-- Cause: missing variable in the Jinja context.
-- AI fix: excellent candidate.
--
-- The Jinja expression below is intentionally invalid so dbt fails before SQL
-- reaches Snowflake.
select
    customer_id,
    order_id,
    {{ env['DBT_FILTER'] }} as filter_value
from ECOMMERCE_DB.RAW.ORDERS

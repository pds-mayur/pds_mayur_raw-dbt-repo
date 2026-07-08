-- This file generates a dbt compilation error because the referenced macro
-- does not exist.
-- Expected dbt message: Macro not found.
-- Cause: macro typo or missing macro definition.
-- AI fix: excellent candidate.
--
-- The Jinja expression below is intentionally invalid so dbt fails before SQL
-- reaches Snowflake.
select
    customer_id,
    order_id,
    {{ missing_macro() }} as macro_value
from ECOMMERCE_DB.RAW.ORDERS

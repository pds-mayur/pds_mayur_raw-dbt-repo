-- This file generates a dbt compilation error caused by an undefined Jinja variable.
-- Expected dbt message: Undefined variable.
-- Cause: missing variable in the Jinja context.
-- AI fix: excellent candidate.
--
select
    customer_id,
    order_id
from ECOMMERCE_DB.RAW.ORDERS
-- This file generates a dbt compilation error because the Jinja statement is
-- intentionally malformed.
-- Expected dbt message: Expected end of statement.
-- Cause: Jinja syntax issue.
-- AI fix: excellent candidate.
--
-- The expression below is incomplete on purpose so dbt fails during rendering.
select
    customer_id,
    order_id,
    {{ ref('orders') } as broken_reference
from ECOMMERCE_DB.RAW.ORDERS

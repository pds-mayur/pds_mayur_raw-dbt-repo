select
    customer_id,
    order_id,
    {{ env['DBT_FILTER'] }} as filter_value
from ECOMMERCE_DB.RAW.ORDERS

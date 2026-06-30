-- models/fct_customers_runtime_fail.sql
select
    customer_id,
    customer_name,
    to_number(customer_name) as boom
from {{ ref('customers') }}

{{ config(materialized='table') }}

select
    column1 as order_id,
    column2 as customer_id
from values
    (1, 101),
    (2, 102),
    (NULL, 103),
    (NULL, 104),
    (3, 105),
    (NULL, 106)

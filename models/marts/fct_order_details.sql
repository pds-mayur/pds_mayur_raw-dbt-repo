{{ config(materialized='table') }}

with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
),
items as (
    select * from {{ ref('stg_order_items') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
products as (
    select * from {{ ref('stg_products') }}
)

select
    o.order_id,
    o.order_date,
    o.order_month,
    o.order_status,
    o.customer_id,
    c.customer_name,
    c.email,
    c.city,
    c.state,
    i.order_item_id,
    i.product_id,
    p.product_name,
    p.category,
    i.quantity,
    i.unit_price as item_unit_price,
    i.line_total as item_line_total,
    pay.payment_method,
    pay.amount as payment_amount,
    pay.payment_status
from orders o
left join customers c
    on o.customer_id = c.customer_id
left join items i
    on o.order_id = i.order_id
left join products p
    on i.product_id = p.product_id
left join payments pay
    on o.order_id = pay.order_id
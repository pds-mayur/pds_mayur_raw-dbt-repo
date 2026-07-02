{{ config(materialized='table') }}

with order_level as (
    select
        o.customer_id,
        c.customer_name,
        c.email,
        c.city,
        c.state,
        o.order_id,
        o.order_date,
        o.order_status,
        coalesce(sum(i.line_total), 0) as order_revenue,
        coalesce(sum(case when pay.payment_status = 'PAID' then pay.amount else 0 end), 0) as paid_amount
    from {{ ref('stg_orders') }} o
    left join {{ ref('stg_customers') }} c
        on o.customer_id = c.customer_id
    left join {{ ref('stg_order_items') }} i
        on o.order_id = i.order_id
    left join {{ ref('stg_payments') }} pay
        on o.order_id = pay.order_id
    group by
        o.customer_id, c.customer_name, c.email, c.city, c.state,
        o.order_id, o.order_date, o.order_status
)

select
    customer_id,
    customer_name,
    email,
    city,
    state,
    count(distinct order_id) as total_orders,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    sum(order_revenue) as lifetime_revenue,
    sum(paid_amount) as lifetime_paid_amount,
    avg(order_revenue) as avg_order_value
from order_level
group by
    customer_id, customer_name, email, city, state
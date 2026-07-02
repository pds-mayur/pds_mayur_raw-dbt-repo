{{ config(materialized='table') }}

with base as (
    select
        p.product_id,
        p.product_name,
        p.category,
        count(distinct oi.order_id) as order_count,
        sum(oi.quantity) as total_units_sold,
        sum(oi.line_total) as total_revenue,
        avg(oi.unit_price) as avg_selling_price
    from {{ ref('stg_products') }} p
    left join {{ ref('stg_order_items') }} oi
        on p.product_id = oi.product_id
    group by
        p.product_id,
        p.product_name,
        p.category
)

select
    *,
    case
        when total_revenue >= 100000 then 'Top Seller'
        when total_revenue >= 25000 then 'Strong Performer'
        when total_revenue > 0 then 'Needs Growth'
        else 'No Sales'
    end as product_tier
from base
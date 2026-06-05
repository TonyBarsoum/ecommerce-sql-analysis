-- =========================================
-- Order Status Conversion Analysis
-- =========================================

-- 1. Overall Order Status Conversion
with status as(
    select
        count(*) as total_orders,
        count(case when order_status = 'delivered' then 1 end) as delivered,
        count(case when order_status = 'shipped' then 1 end) as shipped,
        count(case when order_status = 'canceled' then 1 end) as canceled,
        count(case when order_status = 'processing' then 1 end) as processing
    from orders
)
select
    round(100.00 * delivered / total_orders, 2) as delivered_rate_percent,
    round(100.00 * shipped / total_orders, 2) as shipped_rate_percent,
    round(100.00 * canceled / total_orders, 2) as canceled_rate_percent,
    round(100.00 * processing / total_orders, 2) as processing_rate_percent
from status;

-- 2. Monthly Order Status Conversion Trend
with status_per_month as(
    select
        date_trunc('month', order_purchase_timestamp) as months,
        count(*) as total_orders,
        count(case when order_status = 'delivered' then 1 end) as delivered,
        count(case when order_status = 'shipped' then 1 end) as shipped,
        count(case when order_status = 'canceled' then 1 end) as canceled,
        count(case when order_status = 'processing' then 1 end) as processing
    from orders
    group by months
    order by months
)
select
    months,
    round(100.00 * delivered / total_orders, 2) as delivered_rate_percent,
    round(100.00 * shipped / total_orders, 2) as shipped_rate_percent,
    round(100.00 * canceled / total_orders, 2) as canceled_rate_percent,
    round(100.00 * processing / total_orders, 2) as processing_rate_percent
from status_per_month;

-- 3. Months with Highest Cancellation Rates
with status_highest_month as(
    select
        date_trunc('month', order_purchase_timestamp) as months,
        count(*) as total_orders,
        count(case when order_status = 'canceled' then 1 end) as canceled
from orders
group by months
order by months
)
select
    months,
    round(100.00 * canceled / total_orders, 2) as canceled_rate_percent
from status_highest_month
order by canceled_rate_percent desc;

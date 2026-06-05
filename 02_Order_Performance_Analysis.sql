-- =========================================
-- Order Performance Analysis
-- =========================================

-- 1. Orders by Status
select 
	order_status,
	count(*) as total_orders
from orders
group by order_status
order by total_orders desc;

-- 2. Cancellation Rate
with cancel_orders as (
	select 
		count(*) as canceled_orders
	from orders
	where order_status = 'canceled'
), total_orders as (
	select 
		count(*) as total_orders
	from orders
)
select 
	round (100.0 * canceled_orders / total_orders, 2) as cancellation_rate_percent
from cancel_orders, total_orders;


-- 3. Monthly Orders
select 
	date_trunc('month', order_purchase_timestamp) as month,
	count(*) as total_orders
from orders
group by month
order by month;

-- 4. Delivered Orders Per Month
select 
	date_trunc('month', order_purchase_timestamp) as month,
	count(*) as delivered_orders
from orders
where order_status = 'delivered'
group by month
order by month;

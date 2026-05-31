-- ==============================
-- Monthly Revenue Trend and Growth
-- ==============================

-- 1. Monthly Revenue
select 
	sum(i.price) as revenue,
	date_trunc('month', o.order_purchase_timestamp) as month
from orderitems i
join orders o 
	on i.order_id = o.order_id
group by month
order by month;

-- 2. Monthly Revenue Growth
with monthly_revenue as (
	select 
	sum(i.price) as revenue,
	date_trunc('month', o.order_purchase_timestamp) as month
from orderitems i
join orders o 
	on i.order_id = o.order_id
group by month
order by month
)
select 
	month,
	revenue,
	lag(revenue) over(
	order by month) as previous_month_revenue,
	revenue - lag(revenue) over(
	order by month) as revenue_growth
from monthly_revenue;

-- 3. Monthly Revenue Ranking
with monthly_revnue as(
	select 	
		date_trunc('month', order_purchase_timestamp) as month,
		sum(i.price) as revenue
from orderitems i 
join orders o
	on i.order_id = o.order_id 
group by month
)
select 
	month,
	revenue,
	rank() over(
	order by revenue desc
	) as highest_revenue_rank,
	rank() over(
	order by revenue
	) as lowest_revenue_rank
from monthly_revnue;
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

-- 4.  Monthly Revenue Trend and Month over Month Growth
with monthly_revenue as (
    select
        date_trunc('month', o.order_purchase_timestamp) as revenue_month,
        sum(i.price) as monthly_revenue
    from orders o
    join orderitems i
        on o.order_id = i.order_id
    group by revenue_month
),
monthly_revenue_with_lag as (
    select
        revenue_month,
        monthly_revenue,
        lag(monthly_revenue) over (
            order by revenue_month
        ) as previous_month_revenue
    from monthly_revenue
)
select
    revenue_month,
    monthly_revenue,
    previous_month_revenue,
    monthly_revenue - previous_month_revenue as revenue_change,
    round(
        100.0 * (monthly_revenue - previous_month_revenue)
        / previous_month_revenue,
        2
    ) as revenue_growth_percentage
from monthly_revenue_with_lag
order by revenue_month;



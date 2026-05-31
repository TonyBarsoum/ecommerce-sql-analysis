-- ====================
-- Products Performance
-- ====================


-- 1. Top Selling Product Categories
select
	p.product_category_name,
	count(*) as total_items_sold
from orderitems o
join products_clean p
	on o.product_id = p.product_id
group by p.product_category_name
order by total_items_sold desc;


-- 2. Total Sales by Product Category
select
	p.product_category_name,
	sum(o.price) as total_sales
from orderitems o
join products_clean p
	on o.product_id = p.product_id
group by p.product_category_name
order by total_sales desc;

-- 3. Average Sold Price by Product
select
	product_id,
	round(avg(price), 2) as avg_price
from orderitems
group by product_id
order by avg_price desc;

-- 4. Top 10 Products by Revenue
select 
	product_id,
	sum(price) as total_revenue
from orderitems 
group by product_id 
order by total_revenue desc
limit 10;
-- ========================================
--  Basic Data Quality and Business Metrics
-- ========================================


-- 1. Total Number of Customers
select 
	COUNT(*) as total_customers
from customers;

-- 2. Total Number of Orders
select 
	COUNT(*) as total_orders
from orders;

-- 3. Total Revnue Generated
select  
	sum(payment_value) as total_revenue
from payments;

-- 4. Total Number of Items Sold
select 
	count(*) as total_Orderd_Items
from orderitems;

-- 5. Average Order Value
select
	round(avg(payment_value), 2) as avg_order_value
from payments;

-- 6. Total Unique Products 
select
	count(distinct product_id) as unique_products
from products_clean;

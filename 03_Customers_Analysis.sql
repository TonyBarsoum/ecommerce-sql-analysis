-- =================
-- Customers Analysis
-- =================

-- 1. Unique Customers
select 
	count(distinct customer_id) as unique_customers
from customers;


-- 2. Top 10 Customer States
select 	
	count(*) as total_customers,
	customer_state
from customers
group by customer_state
order by total_customers desc
limit 10;

-- 3. Top 10 Customer Cities
select 	
	count(*) as total_customers,
	customer_city
from customers
group by customer_city
order by total_customers desc
limit 10;

-- 4. Total Orders by Customer State
select
	count(*) as total_orders,
	c.customer_state
from orders o
join customers c
	on o.customer_id = c.customer_id
group by c.customer_state
order by total_orders desc;

-- 5. Delivered Orders by State
select 
	c.customer_state,
	count(*) as delivered_orders
from orders o
join customers c
	on o.customer_id = c.customer_id
where order_status = 'delivered'
group by c.customer_state
order by delivered_orders desc;



-- 6. Repeat customer analysis could not be fully performed because the available table only includes customer_id, which appears to be unique per order rather than a persistent customer identifier. 
--An attempt was made to identify repeat customers using customer_id, but the query returned no results, confirming that this field is likely unique per order.
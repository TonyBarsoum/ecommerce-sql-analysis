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

-- 4. Finds the highest revenue product category for each customer state
with state_category_revenue as (
    select
        c.customer_state,
        p.product_category_name,
        sum(i.price) as category_revenue
    from customers c
    join orders o
        on c.customer_id = o.customer_id
    join orderitems i
        on o.order_id = i.order_id
    join products_clean p
        on i.product_id = p.product_id
    group by
        c.customer_state,
        p.product_category_name
), ranked_categories as (
    select
        customer_state,
        product_category_name,
        category_revenue,
        rank() over (
            partition by customer_state
            order by category_revenue desc
        ) as category_rank
    from state_category_revenue
)
select
    customer_state,
    product_category_name,
    category_revenue,
    category_rank
from ranked_categories
where category_rank = 1
order by category_revenue desc;

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

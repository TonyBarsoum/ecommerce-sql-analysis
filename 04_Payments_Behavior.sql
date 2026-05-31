-- =================
-- Payments Behavior
-- =================

-- 1. Number of Transactions by Payment Type
select 
	payment_type, 
	count(*) as total_transactions
from payments
group by payment_type;

-- 2. Total Revenue by Payment Type
select
    payment_type,
    sum(payment_value) as total_payment_value
from payments
group by payment_type
order by total_payment_value desc;

-- 3. Average Payment Value by Payment Type
select
    payment_type,
    round(avg(payment_value), 2) as avg_payment_value
from payments
group by payment_type
order by avg_payment_value desc;


-- 4. Orders With Multiple Installments
select 
	order_id, 
	payment_installments
from payments 
where payment_installments > 1;

-- 5. Average Installments Per Payment Type
select 
	payment_type, 
	round(avg(payment_installments), 2) as avg_installments
from payments 
group by payment_type;
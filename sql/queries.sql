/* Checking is data imported succesfully or not */
select * from customers limit 10;
select * from orders limit 10;

-- Total Revenue
select round(sum(payment_value),0) as revenue
from order_payments;



-- Total Orders
Select count(*) as total_orders
from orders;

-- Total customers
select count(distinct(customer_id)) as  total_customers
from customers;

-- Top 5 customers by revenue
select o.customer_id,c.customer_unique_id, round(sum(p.payment_value),0) as total_payment from orders as o inner join customers as c on o.customer_id = c.customer_id 
inner join order_payments as p on o.order_id = p.order_id
group by o.customer_id,c.customer_unique_id
order by total_payment desc
limit 5;

-- Monthly revenue
select month(o.order_purchase_timestamp) as Months, round(sum(p.payment_value),0) as Monthly_revenue
from orders as o inner join order_payments as p on o.order_id = p.order_id
group by Months
order by Months asc;





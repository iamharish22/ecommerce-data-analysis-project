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
select count(distinct(customer_unique_id)) as  total_customers
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

-- repeat customers
select customer_id, count(order_id) as total_order
from orders
group by customer_id
having total_order>1;

-- avegrage order values
select round(sum(p.payment_value)/count(distinct o.order_id),0) as avg_order_value
from orders as o inner join order_payments as p on o.order_id = p.order_id;

-- Top performing Categories
select p.product_category_name, count(o.order_id) as total_orders
from orders as o inner join order_items as i on o.order_id = i.order_id
inner join products as p on i.product_id = p.product_id 
group by p.product_category_name
order by total_orders desc
limit 5;

-- Revenue by State
select c.customer_state as state, round(sum(p.payment_value),0) as total_revenue
from customers as c inner join orders as o on c.customer_id = o.customer_id
inner join order_payments as p on o.order_id = p.order_id
group by c.customer_state
order by total_revenue desc;	

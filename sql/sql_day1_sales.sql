select * from sales
--Total sales per customer
select customer_id , sum(amount) as total_sales
from sales
group by customer_id;

--Top 2 products by revenue
select product, sum(amount) as total
from sales
group by product
order by total desc
limit  2

--Running total of sales by date (Window Function)
select sale_date , 
sum(amount) as total_sales,
sum(sum(amount)) over(order by sale_date) as running_total
from sales
group by sale_date
order by sale_date

-- Analyze the cumulative revenue generated over time.
select order_date, round(sum(REVENUE) 
over(order by order_date),3) as cum_revenue from
(SELECT orders.order_date , 
ROUND(SUM((order_details.quantity * pizzas.price)),2) AS REVENUE FROM 
pizzas JOIN order_details ON 
pizzas.pizza_id = order_details.pizaa_id
JOIN orders ON order_details.order_id = orders.order_id
group by orders.order_date) Sales;


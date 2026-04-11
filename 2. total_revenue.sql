-- Calculate the total revenue generated from pizza sales.
USE pizaahut;
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS Total_sale
FROM
    order_details
        JOIN
    pizzas ON order_details.pizaa_id = pizzas.pizza_id

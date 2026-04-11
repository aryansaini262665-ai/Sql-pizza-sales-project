-- Group the orders by date and calculate the average number of pizzas ordered per day.
USE PIZAAHUT;
SELECT 
    ROUND(AVG(QUANTITY), 0) as avg_pizza_orders_per_day
FROM
    (SELECT orders.order_date, SUM(order_details.quantity) AS QUANTITY
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS ORDER_QUANTITY;


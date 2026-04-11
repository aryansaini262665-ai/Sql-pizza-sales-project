-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
   ROUND((SUM(order_details.quantity * pizzas.price) / (SELECT 
            ROUND(SUM(order_details.quantity * pizzas.price),2)
        FROM
            order_details
                JOIN
            pizzas ON order_details.pizaa_id = pizzas.pizza_id)),2) * 100 AS REVENUE
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizaa_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY REVENUE;

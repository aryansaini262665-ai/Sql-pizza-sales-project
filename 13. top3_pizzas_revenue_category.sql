-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name , revenue from
(SELECT 
    category,
    name,
    revenue,
    RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS Rank_
FROM (
    SELECT 
        pizza_types.category,
        pizza_types.name,
        SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details 
    JOIN pizzas 
        ON order_details.pizaa_id = pizzas.pizza_id
    JOIN pizza_types 
        ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    GROUP BY pizza_types.category, pizza_types.name
) AS b) as a where Rank_ <= 3;
SELECT 
    t.order_id, 
    AVG(t.quantity) AS avg_quantity
FROM (
    SELECT * 
    FROM order_details 
    WHERE quantity > 10
) AS t
GROUP BY t.order_id;
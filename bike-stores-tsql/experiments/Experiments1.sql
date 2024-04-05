/***EXPERIMENTS***/

/**
Finding order totals (Unfinished and does not work)
**/


SELECT *
FROM
sales.orders o
CROSS JOIN sales.customers cus
LEFT JOIN(
SELECT oi.order_id , SUM(oi.quantity * oi.list_price) AS [Order Total]
FROM sales.order_items AS oi
GROUP BY order_id
) AS info ON o.order_id = info.order_id


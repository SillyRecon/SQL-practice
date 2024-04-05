/**
Retrieving records of customers with more than 3 orders in each year.
**/
SELECT o.customer_id AS [Customer ID], YEAR (o.order_date) AS [Order Date], COUNT (order_id) AS [Number of Orders]
FROM sales.orders o
GROUP BY o.customer_id, YEAR(o.order_date)
HAVING COUNT(o.order_id) > 2
ORDER BY o.customer_id;
/**
Retrieving records of orders that have a net value of less than 15000
**/
SELECT oi.order_id AS [Order ID], SUM(oi.quantity * oi.list_price * (1 - discount)) AS [Net Value]
FROM sales.order_items oi
GROUP BY oi.order_id
HAVING SUM(oi.quantity * oi.list_price * (1 - oi.discount)) < 15000
ORDER BY [Net Value];
/**
Retrieving records of products that are the max and min price in each category and then finding the ones with
a maximum price greater than 4000 or a minimum price less than 500.
**/
SELECT c.category_name AS [Category], MAX(p.list_price) AS [Max List Price], MIN(p.list_price) AS [Min List Price]
FROM production.products p
LEFT JOIN production.categories c ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING MAX(p.list_price) > 4000 OR MIN(p.list_price) < 500;
/**
Retrieving records of products that have an average price between 500 and 1000;
**/
SELECT c.category_name AS [Category], AVG(p.list_price) AS [Average List Price]
FROM production.products p
LEFT JOIN production.categories c ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING AVG(p.list_price) BETWEEN 500 AND 1000;
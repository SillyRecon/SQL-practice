/**
Retrieving the customer_id and the distinct years they made orders on. This is done
by using the sales.orders table and grouping the customer_id and order date year.
**/
SELECT customer_id AS [Customer ID], YEAR (order_date) AS [Order Date]
FROM sales.orders
GROUP BY customer_id, YEAR(order_date)
ORDER BY customer_id;
/**
Retrieving the customer_id and the number of orders they made each year.
**/
SELECT customer_id AS [Customer ID], YEAR(order_date) AS [Order Year], COUNT(order_id) AS [Orders placed]
FROM sales.orders
GROUP BY customer_id, YEAR(order_date)
ORDER BY customer_id;
/**
Retrieving the number of customers in each city
**/
SELECT city AS [City], state AS [State], COUNT (customer_id) AS [No. of customers]
FROM sales.customers
GROUP BY city, state
ORDER BY city;
/**
Retrieving the maximum and minimum prices of models made in the year 2018 by brand.
**/
SELECT b.brand_name as [Brand], MIN(p.list_price) as [Minimum Product Price], MAX(p.list_price) as [Maximum Product Price]
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE model_year = 2018
GROUP BY b.brand_name
ORDER BY b.brand_name;
/**
Retrieving the average prices of models made in the year 2018 by brand.
**/
SELECT b.brand_name, AVG(p.list_price) AS [Average Price]
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
WHERE model_year = 2018
GROUP BY b.brand_name
ORDER BY b.brand_name;
/**
Retrieving the net value of every order
**/
SELECT order_id AS [Order ID], SUM(quantity * list_price * (1 - discount)) AS [Net Value]
FROM sales.order_items
GROUP BY order_id;
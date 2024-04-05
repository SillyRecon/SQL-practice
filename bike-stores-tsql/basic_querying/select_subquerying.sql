/**
Finding sales orders from customers that are located in Houston.
**/
SELECT o.order_id AS [Order ID], o.order_date AS [Order Date], o.customer_id AS [Customer ID]
FROM sales.orders o
WHERE o.customer_id IN
(
	SELECT cus.customer_id
	FROM sales.customers cus
	WHERE cus.city = 'Houston'
)
ORDER BY o.order_date DESC;
/**
Nested Subquery
Using a nested query to find the brand ids of the Strider and Trek brands, then using that result set to find the
the list of products belonging to those brands. That result set is used to find the average price of the products
belonging to those brands.
**/
SELECT p.product_name AS [Product Name], p.list_price AS [Price]
FROM production.products p
WHERE list_price > (
	SELECT AVG(list_price)
	FROM production.products
	WHERE brand_id IN (
		SELECT brand_id
		FROM production.brands
		WHERE brand_name = 'Strider' OR brand_name = 'Trek'
	)
) ORDER BY list_price;
/**
Using a nested query to find the maximum list price of a product in an order.
**/
SELECT o.order_id AS [Order ID], o.order_date AS [Order Date],
(
	SELECT MAX(i.list_price)
	FROM sales.order_items i 
	WHERE i.order_id = o.order_id
) AS [Max List Price]
FROM sales.orders o
ORDER BY o.order_date DESC;
/**
Finding all the names of mountain bikes and road bikes that are for sale.
**/
SELECT p.product_id AS [Product ID], p.product_name AS [Product Name]
FROM production.products p
WHERE p.category_id IN (
	SELECT category_id
	FROM production.categories
	WHERE category_name = 'Mountain Bikes' OR category_name = 'Road Bikes'
);
/**
Finding the product id and price of products who's prices are greater than or equal to
the average price of the products in a brand.
**/
SELECT p.product_id AS [Product ID], p.list_price AS [Product Price]
FROM production.products p
WHERE p.list_price >= ANY (
	SELECT AVG(list_price)
	FROM production.products
	GROUP BY brand_id
);
/**
Similar to the above query, but using the ALL operator on the subquery.
**/
SELECT p.product_id AS [Product ID], p.list_price AS [Product Price]
FROM production.products p
WHERE p.list_price >= ALL (
	SELECT AVG(list_price)
	FROM production.products
	GROUP BY brand_id
);
/**
Finding the customers who bought products in 2017.
**/
SELECT customer_id AS [Customer ID], first_name + ' ' + last_name AS [Customer Name], city AS [City]
FROM sales.customers c
WHERE EXISTS (
	SELECT customer_id
	FROM sales.orders o
	WHERE o.customer_id = c.customer_id AND YEAR(order_date) = 2017
)ORDER BY first_name, last_name;
/**
Finding products with a list_price equal to the highest list price in the same category.
**/
SELECT product_name, list_price, category_id
FROM production.products p1
WHERE list_price IN (
	SELECT MAX(p2.list_price)
	FROM production.products p2
	WHERE p2.category_id = p1.category_id
	GROUP BY p2.category_id
) ORDER BY category_id, product_name;
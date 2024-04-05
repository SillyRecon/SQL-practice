/**
Getting an idea of what the different records in the following tables contain.
**/
SELECT * FROM production.brands;
SELECT * FROM production.products;
SELECT * FROM production.stocks;
SELECT * FROM sales.stores;
SELECT * FROM sales.orders;
SELECT * FROM sales.order_items;

/************INNER JOINS***************/
/**
Retrieving product's stock availabilty present at different stores in the production.products table by inner
joining with the production.stocks and sales.stores tables.
**/
SELECT p.product_name as [Product], s.quantity as [Stocks Available], st.store_name as [Store Name] 
FROM production.products p
INNER JOIN production.stocks s ON s.product_id = p.product_id
INNER JOIN sales.stores st ON st.store_id = s.store_id;
/**
Retrieving products from production.products table and their category by inner
joining with the production.categories table. Ordered by category_name.
**/
SELECT p.product_name as [Product], c.category_name as [Category]
FROM production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
ORDER BY c.category_name ASC;
/**
Retrieving products from production.products table and their category, brand and price by inner
joining with the production.categories and production.brands tables. Ordered by list_price.
**/
SELECT p.product_name as [Product], c.category_name as [Category], b.brand_name as [Brand], p.list_price as [Price]
FROM production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY p.list_price ASC;
/**
Retrieving products from production.products table and their order ids by inner
joining with the sales.order_items to determine products with no sales by using
a where clause to check for nulls in order ids.
**/
SELECT p.product_name as [Product], oi.order_id as [Order ID]
FROM production.products p
LEFT JOIN sales.order_items oi ON oi.product_id = p.product_id
WHERE oi.order_id IS NULL;


/************LEFT JOINS***************/
/**
Retrieving product orders and their order items (IDs and product names) by retrieving the product names from
the production.products tables and doing a left join on the sales.orders and sales.order_items tables. Excluding
any products with no orders and ordering by order_id and Order Item Name.
**/
SELECT oi.order_id as [Order ID], oi.item_id as [Order Item ID], o.order_date as [Order Date], p.product_name as [Order Item Name]
FROM production.products p
LEFT JOIN sales.order_items oi ON oi.product_id = p.product_id
LEFT JOIN sales.orders o ON o.order_id = oi.order_id
WHERE oi.order_id IS NOT NULL
ORDER BY [Order ID],[Order Item Name];
/**
Retrieving the products names and ids for the order with an ID of 100 by retrieving product names from the 
production.products table and then left joining the sales.orders_items table
**/
SELECT p.product_id as [Product ID], p.product_name as [Product Name], o.order_id as [Order ID]
FROM production.products p
LEFT JOIN sales.order_items o ON o.product_id = p.product_id AND o.order_id = 100
WHERE o.order_id IS NOT NULL
ORDER BY order_id DESC;


/************RIGHT JOINS***************/
/**
Retrieving Order IDs and the products associated with the orders items by 
taking the order_ids in the sales.order_items table and right joining it with the production.products
table.
**/
SELECT p.product_name as [Product Name], o.order_id as [Order ID]
FROM sales.order_items o
LEFT JOIN production.products p ON o.product_id = p.product_id
ORDER BY order_id DESC;


/************FULL OUTER JOINS***************/
/**
Creating a table for Shipping data showing customer names, customer Phone (if available),
their order info in the form of Order ID,Order Date, Order Status, Store address to ship from,
and Customer address to ship to. This is accomplished by querying the sales.orders table and 
doing a full outer join on the sales.stores table, then a left join on the sales.store table.
**/
SELECT 
cus.first_name + ' ' + cus.last_name AS [Customer Name],
o.order_id AS [Order ID],
o.order_date AS [Order Date],
CASE o.order_status
	WHEN 1 THEN 'PENDING'
	WHEN 2 THEN 'PROCESSING'
	WHEN 3 THEN 'REJECTED'
	WHEN 4 THEN 'COMPLETED'
END AS [Order Status],
cus.street + ', ' + cus.city + ', ' + cus.state + ', ' + cus.zip_code AS [Ship to],
COALESCE(cus.phone, 'N/A') AS [Customer Phone],
st.store_name + ', ' + st.street + ', ' + st.city + ', ' + st.state + ', ' + st.zip_code AS [Ship from]
FROM sales.orders o
FULL OUTER JOIN sales.stores st ON o.store_id = st.store_id
LEFT JOIN sales.customers cus ON cus.customer_id = o.customer_id;


/************CROSS JOINS***************/
/**
Using a cross join to find the products that have no sales across the stores.
**/
SELECT 
s.store_id,
p.product_id,
ISNULL(sales, 0) AS sales
FROM
sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
	SELECT
		s.store_id,
		p.product_id,
		SUM (quantity * i.list_price) AS sales
	FROM
		sales.orders o
	INNER JOIN sales.order_items i ON i.order_id = o.order_id
	INNER JOIN sales.stores s ON s.store_id = o.order_id
	INNER JOIN production.products p ON p.product_id = i.product_id
	GROUP BY
		s.store_id,
		p.product_id
) c ON c.store_id = s.store_id AND c.product_id = p.product_id
WHERE sales IS NULL
ORDER BY product_id, store_id;



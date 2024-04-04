/**
Getting an idea of what the different records in the following tables contain.
**/
SELECT * FROM production.brands;
SELECT * FROM production.products;
SELECT * FROM production.stocks;
SELECT * FROM sales.stores;
SELECT * FROM sales.orders;
SELECT * FROM sales.order_items;
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



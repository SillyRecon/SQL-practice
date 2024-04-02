/**
Retrieving the top 10 rows using the product_name and list_price columns from 
the production.products table, ordered by list_price descending.
**/
SELECT TOP 10 product_name, list_price
FROM production.products
ORDER BY list_price DESC;
/**
Retrieving the top 1 percent rows using the product_name and list_price columns from 
the production.products table, ordered by list_price descending.
**/
SELECT TOP 1 PERCENT product_name, list_price
FROM production.products
ORDER BY list_price DESC;
/**
Retrieving the top 3 rows, including ties, using the product_name and list_price columns from 
the production.products table, ordered by list_price descending.
**/
SELECT TOP 3 WITH TIES product_name, list_price
FROM production.products
ORDER BY list_price DESC;
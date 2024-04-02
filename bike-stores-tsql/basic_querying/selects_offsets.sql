/**
Retrieving the product_name and list_price columns from the production.products table,
ordered by list_price and product_name ascending.
**/
SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name ASC;
/**
Retrieving the product_name and list_price columns from the production.products table,
ordered by list_price and product_name ascending, skipping the first 10 rows.
**/
SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name ASC
OFFSET 10 ROWS;
/**
Retrieving the product_name and list_price columns from the production.products table,
ordered by list_price and product_name ascending, skipping the first 10 rows and only retrieving
the next 15 rows.
**/
SELECT product_name, list_price
FROM production.products
ORDER BY list_price, product_name ASC
OFFSET 5 ROWS
FETCH NEXT 15 ROWS ONLY;
/**
Retrieving the product_name and list_price columns from the production.products table,
ordered by list_price descending and product_name and only retrieving
the first 15 rows. In other words getting the most expensive products.
**/
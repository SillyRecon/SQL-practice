/**
Retrieving the products that have a category of 2 from the production.products table.
**/
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products	
WHERE category_id = '2'
ORDER BY list_price DESC;
/**
Retrieving the products that have a category of 2 from the production.products table,
and also have a model year of 2016 or 2017.
**/
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products	
WHERE category_id = '2' AND (model_year = 2017 OR model_year = 2016)
ORDER BY list_price DESC;
/**
Retrieving the products from the production.products table that have a list_price
between 600.00 and 1000.00.
**/
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products	
WHERE list_price BETWEEN 600.00 AND 1000.00
ORDER BY list_price DESC;
/**
Retrieving the products from the production.products table,
that have a list_price of 619.99, 2899.99, 269.99 or 999.99.
**/
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products	
WHERE list_price IN (619.99, 2899.99, 269.99, 999.99)
ORDER BY list_price DESC;
/**
Retrieving the products from the production.products table,
that have a product name with the term 'Electra' in it.
**/
SELECT product_id, product_name, category_id, model_year, list_price
FROM production.products	
WHERE product_name LIKE '%Electra%'
ORDER BY list_price DESC;

--For Referencing the entire table
SELECT * FROM production.products
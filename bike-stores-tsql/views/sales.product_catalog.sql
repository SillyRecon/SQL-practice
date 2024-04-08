/**
Creating a view to access the records of products.
**/
CREATE OR ALTER VIEW sales.product_catalog AS
	SELECT
	product_name, category_name, brand_name, list_price
	FROM production.products p
	INNER JOIN production.categories c ON c.category_id = p.category_id
	INNER JOIN production.brands b ON b.brand_id = p.brand_id;
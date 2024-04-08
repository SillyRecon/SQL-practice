/**
Creating a view for getting full product information using a indexed view.
**/
CREATE OR ALTER VIEW product_master
WITH SCHEMABINDING
AS
SELECT product_id AS [Product ID], product_name AS [Product Name], model_year AS [Model Year],
       list_price AS [List Price], brand_name AS [Brand Name], category_name AS [Category Name]
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id;
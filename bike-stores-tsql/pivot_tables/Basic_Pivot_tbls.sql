/**
Pivot Tables
**/
/**
Using a Pivot table to get the result set of the number of products per category per model year.
**/
SELECT * FROM
(
	SELECT category_name, product_id, model_year
	FROM production.products p
	INNER JOIN production.categories c ON c.category_id = p.category_id
) t
PIVOT (
	COUNT(product_id) 
	FOR category_name IN (
		[Children Bicycles],
		[Comfort Bicycles],
		[Cruisers Bicycles],
		[Cyclocross Bicycles],
		[Electric Bikes],
		[Mountain Bikes],
		[Road Bikes]
	)

) AS [Product Count by Category];
/**
Generating column names to use in the dynamic statement with quotename(), then generating a
Pivot table to get the result set of the number of products per category per model year
using dynamic sql.
**/
DECLARE
@columns NVARCHAR(MAX) = '',
@stm NVARCHAR(MAX) = '';

SELECT @columns += QUOTENAME(category_name) + ',' 
FROM production.categories
ORDER BY category_name;

SET @columns = LEFT(@columns, LEN(@columns) - 1);

SET @stm = '
SELECT * FROM
(
	SELECT category_name, model_year, product_id
	FROM production.products p
	INNER JOIN production.categories c ON c.category_id = p.category_id
)t
PIVOT(
	COUNT(product_id)
	FOR category_name IN (' + @columns + ')
) AS [Product Count by Category];';

EXECUTE sp_executesql @stm;
/**
Generating column names to use in the dynamic statement with quotename() using first_name(s) from the sales.staff tables, then generating a
Pivot table to get the result set of the sales based off over orders each staff member added, using dynamic sql.
**/
DECLARE
@columns2 NVARCHAR(MAX) = '',
@stm2 NVARCHAR(MAX) = '';

SELECT @columns2 += QUOTENAME(first_name) + ',' 
FROM sales.staffs o
WHERE o.manager_id is not null
ORDER BY first_name
SELECT @columns2;

SET @columns2 = LEFT(@columns2, LEN(@columns2) - 1);

SET @stm2 = '
SELECT * FROM
(
	SELECT s.first_name, SUM(oi.quantity) as quantity
	FROM sales.orders o
	INNER JOIN sales.order_items oi ON oi.order_id = o.order_id
	INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
	GROUP BY o.staff_id, s.first_name
)t
PIVOT(
	SUM(quantity)
	FOR first_name IN (' + @columns2 + ')
) AS [Product Count by Category];';

EXECUTE sp_executesql @stm2;

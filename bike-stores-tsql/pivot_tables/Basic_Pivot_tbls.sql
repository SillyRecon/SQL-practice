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



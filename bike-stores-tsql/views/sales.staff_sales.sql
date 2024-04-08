/**
Creating a view to access the records of sales amounts made by each staff member.
**/
CREATE OR ALTER VIEW sales.staff_sales (
	[First Name], [Last Name], [Year], [Total Sales Amount]
) AS
	SELECT first_name, last_name, YEAR(order_date), SUM(list_price * quantity) AS amount
	FROM sales.order_items i
	INNER JOIN sales.orders o ON i.order_id = o.order_id
	INNER JOIN sales.staffs s ON s.staff_id = o.order_id
	GROUP BY first_name, last_name, YEAR(order_date);
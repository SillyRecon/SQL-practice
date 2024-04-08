/**
Creating a view to access the records of sales made on each day.
**/
CREATE OR ALTER VIEW sales.daily_sales (
	[Year], [Month], [Day], [Customer Name], [Product ID], [Product Name], [Sales Figures]
)
AS
SELECT year(order_date), month(order_date), day(order_date), concat(first_name, ' ', last_name),
	   p.product_id, product_name, quantity * i.list_price
FROM sales.orders o
INNER JOIN sales.order_items i ON o.order_id = i.order_id
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN sales.customers c ON c.customer_id = o.customer_id
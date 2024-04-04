/**
Retrieving the first_name and last_name columns, then concatenating the row values
into a column called "Full Name", ordered by first_name, from the sales.customers table.
**/
SELECT first_name + ' ' + last_name as [Full Name]
FROM sales.customers	
ORDER BY first_name;
/**
Retrieving the customer_id, first_name and last_name columns from the sales.customers table
with the first_name and last_name columns concatenated into a column called "Full Name". Also
retrieving the order_id column by inner joining the sales.orders column.
**/
SELECT c.customer_id, c.first_name + ' ' + c.last_name as [Full Name], o.order_id
FROM sales.customers c
INNER JOIN sales.orders o ON o.customer_id = c.customer_id

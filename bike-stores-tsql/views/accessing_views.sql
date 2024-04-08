/**
A list of all the views for the Bike Stores DB
**/
--Daily Sales View
SELECT *
FROM sales.daily_sales;
--Staff Sales View
SELECT *
FROM sales.staff_sales;
--Product Catalog View
SELECT *
FROM sales.product_catalog;

/**
--Use to clear the Views
DROP VIEW IF EXISTS
	sales.daily_sales,
	sales.staff_sales,
	sales.product_catalog;
**/
/**
Retrieving all columns from the sales.customers table.
**/
SELECT * FROM sales.customers;
/**
Retrieving the first_name and last_name columns from the sales.customers table.
**/
SELECT first_name as [First Name], last_name as [Last Name]
FROM sales.customers;
/**
Retrieving all columns from the sales.customers table that meet the condition that the
state column has a value of "TX".
**/
SELECT *
FROM sales.customers
WHERE state = 'TX';
/**
Retrieving all columns from the sales.customers table that meet the condition that the
state column has a value of "TX" and the ZIP code starts with "77".
**/
SELECT *
FROM sales.customers
WHERE state = 'TX' AND zip_code LIKE '77%';
/**
Retrieving all columns from the sales.customers table that meet the condition that the
email column has entries ending with "@aol.com" and ordered by the first_name column
ascending.
**/
SELECT *
FROM sales.customers
WHERE email LIKE '%@aol.com'
ORDER BY first_name ASC;
/**
Retrieving the city column, grouping the cities by name and the count of customers in
each city from the sales.customers table provided it meets the condition that the 
state column has entries with "NY" and ordered by city ascending.
**/
SELECT city, COUNT(*)
FROM sales.customers
WHERE state = 'NY'
GROUP BY city, state
ORDER BY city ASC;
/**
Retrieving the city column, grouping the cities by name and the count of customers in
each city from the sales.customers table provided it meets the condition that the state 
column has entries with "NY",the number of customers is greater than 15 and ordered by city ascending.
**/
SELECT city, COUNT(*)
FROM sales.customers
WHERE state = 'NY'
GROUP BY city, state
HAVING COUNT(*) > 15
ORDER BY city ASC;
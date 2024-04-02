/**
Retrieving the distinct cities in the sales.customers table.
**/
SELECT DISTINCT city
FROM sales.customers
WHERE state = 'TX'
ORDER BY city;
/**
Retrieving the distinct cities in each state in the sales.customers table.
**/
SELECT DISTINCT city, state
FROM sales.customers
ORDER BY city, state;
/**
Retrieving the distinct phone numbers in the sales.customers table.
**/
SELECT DISTINCT phone
FROM sales.customers
ORDER BY phone;
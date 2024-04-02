/**
Retrieving customner names from the sales.customers table,
who's last names start with 'e'.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE 'e%'
ORDER BY first_name DESC;
/**
Retrieving customner names from the sales.customers table,
who's last names end with 'er'.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE '%er'
ORDER BY first_name DESC;
/**
Retrieving customner names from the sales.customers table,
who's last names have 'n' as their third character.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE '__n%'
ORDER BY first_name DESC;
/**
Retrieving customner names from the sales.customers table,
who's last names start with 'A' or 'D'.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE '[AD]%'
ORDER BY first_name DESC;
/**
Retrieving customner names from the sales.customers table,
who's last names start with any character between 'D' and 'H' inclusive.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE '[D-H]%'
ORDER BY first_name DESC;
/**
Retrieving customner names from the sales.customers table,
who's last names start with any character that is not between 'D' and 'H' inclusive.
**/
SELECT customer_id, first_name, last_name
FROM sales.customers	
WHERE last_name LIKE '[^D-H]%'
ORDER BY first_name DESC;


/**
Creating a table to help test escape characters.
**/
CREATE TABLE sales.reviews (
  review_id INT IDENTITY(1, 1) PRIMARY KEY, 
  review VARCHAR(255) NOT NULL
);
/**
Inserting records into the table for testing.
**/
INSERT INTO sales.reviews(review)
VALUES('I wish this bike was lighter by 5lbs.'),
      ('This bike would be worth it if it was 20% cheaper.'),
      ('I got this bike when it was 20 dollars cheaper, glad about that.');
/**
Checking if the table exists.
**/
SELECT * 
FROM sales.reviews;
/**
Should only get the second record since we are looking for the term '20%'.
**/
SELECT review_id, review
FROM sales.reviews
WHERE review LIKE '%20%';
/**
Should only get the second record since we are looking for the term '20%'.
Added a escape character to help distinguish the '%' so that only the second
record is found.
**/
SELECT review_id, review
FROM sales.reviews
WHERE review LIKE '%20!%%' ESCAPE '!';
/**
Deleting the test table.
**/
DROP TABLE sales.reviews;
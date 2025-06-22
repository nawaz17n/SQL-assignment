-- Question-1. Create a table called employees with the following structure?
-- * emp_id (integer, should not be NULL and should be a primary key)
-- * emp_name (text, should not be NULL)
-- * age (integer, should have a check constraint to ensure the age is at least 18)
-- * email (text, should be unique for each employee)
-- * salary (decimal, with a default value of 30,000).

CREATE database Assignment;
use Assignment;
CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
	email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL DEFAULT 30000
);





-- Question-2. Explain the purpose of constraints and how they help maintain data integrity in a database. 
-- Provide examples of common types of constraints.
   
"Ans":- Constraints are rules applied to database columns to enforce data integrity and ensure that the data stored in a database adheres to certain standards and requirements.
### Purposes of Constraints:
#### Data Integrity: 
Constraints ensure that the data entered into the database is valid and meets specific criteria which helps maintain the overall integrity of the database.
#### Consistency: 
They enforce rules that keep data consistent across the database preventing anomalies and ensuring that related data remains synchronized.
#### Validation: 
Constraints validate data at the time of insertion or update preventing incorrect or inappropriate data from being stored.
#### Relationships: 
They help define relationships between tables ensuring that foreign keys reference valid primary keys in related tables.
### Common Types of Constraints:
#### NOT NULL: 
Ensures that a column cannot have a NULL value. This is used when a field is required.
* Example: emp_name TEXT NOT NULL ensures that every employee must have a name.
#### UNIQUE: 
Ensures that all values in a column are distinct from one another, preventing duplicate entries.
* Example: email TEXT UNIQUE ensures that no two employees can have the same email address.
#### PRIMARY KEY: 
A combination of NOT NULL and UNIQUE. It uniquely identifies each record in a table and ensures that the column cannot contain NULL values.
* Example: emp_id INTEGER NOT NULL PRIMARY KEY uniquely identifies each employee.
#### FOREIGN KEY: 
Establishes a relationship between two tables by ensuring that a value in one table matches a value in another table. This helps maintain referential integrity.
* Example: In a departments table, a department_id column in the employees table could be a foreign key referencing the department_id in the departments table.
#### CHECK: 
Ensures that all values in a column satisfy a specific condition. This is used for custom validation rules.
* Example: age INTEGER CHECK (age <= 20) ensures that the age of students is at most 20.
#### DEFAULT: 
Provides a default value for a column when no value is specified during insertion.
* Example: salary DECIMAL DEFAULT 60000 sets the default salary to 60000 if no salary is provided.





-- Question- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

### Why Apply the NOT NULL Constraint?
The NOT NULL constraint is applied to a column to ensure that it cannot contain NULL values.
#### Data Completeness: 
By enforcing that a column must have a value, we ensure that all necessary information is captured. 
This is particularly important for fields that are essential for the business logic or application functionality.
#### Avoiding Ambiguity: 
NULL values can introduce ambiguity in data interpretation. 
For example, if a column is allowed to be NULL 
it may be unclear whether the absence of a value indicates that the information is unknown, not applicable, or simply missing. 
The NOT NULL constraint clarifies that a value must be provided.
#### Improving Data Integrity: 
By ensuring that certain columns always contain valid data, we enhance the overall integrity of the database. 
This helps prevent errors and inconsistencies in data processing and reporting.
#### Facilitating Queries: 
Queries that involve columns with NULL values can become more complex, as special handling is required to account for NULLs. 
By using NOT NULL, we simplify query logic and improve performance.
#### Business Rules Enforcement: 
In many cases business rules dictate that certain fields must always have a value. 
For example in an employee database it may be essential that every employee has a name so the emp_name column would be defined as NOT NULL.
### Can a Primary Key Contain NULL Values?
No, a primary key cannot contain NULL values. The primary key serves as a unique identifier for each record in a table.
#### Uniqueness: 
Each value in the primary key column(s) must be unique across the table ensuring that no two records can have the same primary key value.
#### Non-NULL: 
A primary key must always have a value it cannot be NULL. 
This is because a NULL value would not provide a valid identifier for a record, violating the purpose of the primary key.





## Question-4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.

* To add or remove constraints on an existing table in SQL we typically use the ALTER TABLE statement
### Steps To Apply Constraints
* Identify the Table
* Determine the Constraint Type
* Use the ALTER TABLE Command
### Adding a Constraint
* To add a constraint to an existing table we use the ALTER TABLE statement followed by the ADD CONSTRAINT clause
* Specify the Constraint Name

USE assignment;
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

### Removing a Constraint
-- To remove a constraint from an existing table we use the ALTER TABLE statement followed by the DROP CONSTRAINT clause.

ALTER TABLE employees
DROP CONSTRAINT unique_email;





## Question- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints Provide an example of an error message that might occur when violating a constraint.

### Consequences of Violating Constraints
#### Transaction Failure: 
The operation will fail and the database will not execute the action. This ensures that the integrity of the data is maintained.
#### Error Messages: 
The database management system (DBMS) will typically return an error message indicating the nature of the violation. 
This message can help developers and users understand what went wrong.
#### Rollback of Changes: 
If the operation is part of a transaction the entire transaction may be rolled back, meaning that any changes made during that transaction will be undone. 
This is crucial for maintaining data consistency.
#### Application Behavior: 
If the application does not handle these errors properly it may crash or behave unexpectedly. 
Proper error handling is essential to provide a good user experience.
#### Data Integrity Issues: 
If constraints are not enforced it could lead to data integrity issues such as duplicate records, orphaned records, or invalid data entries.
### Error:-
#### 1.Inserting a Duplicate Email: 
If we try to insert a new employee with an email that already exists in the database, you will violate the unique constraint on the email column.
-- SQL Code For Inserting values
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (1, 'John Doe', 30, 'john.doe@example.com', 50000);
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (2, 'Jane Smith', 25, 'john.doe@example.com', 60000);

-- Error Message:- 11:59:42	INSERT INTO employees (emp_id, emp_name, age, email, salary) VALUES (2, 'Jane Smith', 25, 'john.doe@example.com', 60000)	Error Code: 1062. Duplicate entry 'john.doe@example.com' for key 'employees.email'	0.031 sec

#### 2.Inserting an Employee Under Age: 
If we try to insert an employee with an age less than 18, you will violate the check constraint on the age column.
INSERT INTO employees (emp_id, emp_name, age, email, salary)
VALUES (3, 'Alice Johnson', 17, 'alice.johnson@example.com', 45000);

-- Error message:- 12:01:02	INSERT INTO employees (emp_id, emp_name, age, email, salary) VALUES (3, 'Alice Johnson', 17, 'alice.johnson@example.com', 45000)	Error Code: 3819. Check constraint 'employees_chk_1' is violated.	0.000 sec





## Question -6.

-- Table that was created by me
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
    
-- When I realise that
-- The product_id should be a primary key.
-- The price should have a default value of 50.00

ALTER TABLE products
ADD CONSTRAINT product_id PRIMARY KEY (product_id);
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;





## Question - 7.
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    class_id INT NOT NULL
);
INSERT INTO students (student_id,student_name, class_id) VALUES
(1,'Alice', 101),
(2,'Bob', 102),
(3,'Charlie', 101);

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL
);
INSERT INTO classes (class_id,class_name) VALUES
(101,'Mathematics'),
(102,'Science'),
(103, 'History');

SELECT students.student_name, classes.class_name 
FROM students INNER JOIN classes
ON 
students.class_id = classes.class_id;





## Question - 8.
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL,
    customer_id INT NOT NULL
);

INSERT INTO orders (order_id,order_date, customer_id) VALUES
(1,'2024-01-01', 101),
(2,'2024-01-03', 102);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);
INSERT INTO customers (customer_id,customer_name) VALUES
(101,'Alice'),
(102,'Bob');

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    order_id INT
);
INSERT INTO products (product_id,product_name, order_id) VALUES
(1,'Laptop', 1),
(2,'phone', NULL);

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT 
    o.order_id,
    c.customer_name,
    p.product_name
FROM 
    products p
LEFT JOIN 
    orders o ON p.order_id = o.order_id
LEFT JOIN 
    customers c ON o.customer_id = c.customer_id;
    
    
    
    
    
## Question - 9.

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO sales (sale_id,product_id, amount) VALUES
(1, 101, 500),
(2, 102,300),
(3, 101,700);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
    );
    
INSERT INTO products (product_id,product_name) VALUES
(101,'Laptop'),
(102,'phone');

SELECT * FROM sales;
SELECT * FROM products;

SELECT products.product_name, SUM(sales.amount) AS total_sales
FROM sales
INNER JOIN products
ON sales.product_id = products.product_id
GROUP BY products.product_name;



## Question - 10.
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL,
    customer_id INT NOT NULL
);

INSERT INTO orders (order_id,order_date, customer_id) VALUES
(1,'2024-01-02', 1),
(2,'2024-01-05', 2);

CREATE TABLE Order_Details(
	order_id  INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (customer_id, customer_name) VALUES 
(1, 'Alice'),
(2, 'Bob');


INSERT INTO Order_Details (order_id,product_id, quantity) VALUES
(1,101,2),
(2,102,1),
(3,101,3);

SELECT * FROM Orders;
SELECT * FROM Customers;
SELECT * FROM Order_Details;

SELECT 
    o.order_id,
    c.customer_name,
    od.quantity
FROM 
    orders o
INNER JOIN 
    customers c ON o.customer_id = c.customer_id
INNER JOIN 
    Order_Details od ON o.order_id = od.order_id;






# SQL Commands

## Question.1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

USE mavenmovies;

### Primary Keys
A primary key is a unique identifier for a record in a table. It ensures that each record can be uniquely identified and cannot be null. 
In a movie database.
#### Movies Table
* movie_id: A unique identifier for each movie .
#### Actors Table
* actor_id: A unique identifier for each actor.
#### Directors Table
* director_id: A unique identifier for each director.
#### Genres Table
* genre_id: A unique identifier for each genre.
#### Reviews Table
* review_id: A unique identifier for each review.

### Foreign Keys
A foreign key is a field in one table that uniquely identifies a row of another table. 
It establishes a relationship between the two tables. In a movie database.
#### Movies Table
* director_id: A foreign key referencing director_id in the Directors table, indicating which director made the movie.
#### Actors Table
* movie_id: A foreign key referencing movie_id in the Movies table, indicating which movies an actor has appeared in.
#### Reviews Table
* movie_id: A foreign key referencing movie_id in the Movies table, indicating which movie the review is for.
* actor_id: A foreign key referencing actor_id in the Actors table, if the review is associated with a specific actors performance.
#### Genres Table
* movie_id: A foreign key referencing movie_id in the Movies table, indicating which genres a movie belongs to.

### Differences Between Primary Keys and Foreign Keys
#### Purpose:
* Primary Key: Uniquely identifies each record in a table.
* Foreign Key: Establishes a link between two tables, allowing for the creation of relationships.
#### Uniqueness:
* Primary Key: Must contain unique values and cannot contain null values.
* Foreign Key: Can contain duplicate values and can also contain null values .
#### Table Association:
* Primary Key: Exists in the table it identifies.
* Foreign Key: Exists in a table that references another table.
#### Data Integrity:
* Primary Key: Ensures that each record is unique and identifiable.
* Foreign Key: Ensures referential integrity between tables, meaning that a foreign key value must match a primary key value in the referenced table or be null.





## Question- 2. List all details of actors

SELECT * FROM actor;




## Question- 3.List all customer information from DB.

SELECT * FROM customer;


## Question . 4 -List different countries.
SELECT DISTINCT country
FROM country;



## Question - 5.Display all active customers

SELECT customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update
FROM customer
WHERE active = 1;


## Question- 6 .List of all rental IDs for customer with ID 1.
SELECT rental_id
FROM rental
WHERE customer_id = 1;



## Question-7.Display all the films whose rental duration is greater than 5 .
SELECT film_id, title, rental_duration
FROM film
WHERE rental_duration > 5;



## Question- 8. List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT film_id, title, replacement_cost
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;



## Question-9. Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_name_count
FROM actor;



## Question- 10. Display the first 10 records from the customer table .
SELECT * FROM customer
LIMIT 10;



## Question-11. Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT customer_id,first_name,last_name FROM customer
WHERE first_name LIKE 'b%'
LIMIT 3;




## Question-12. Display the names of the first 5 movies which are rated as ‘G’.
SELECT film_id,title,description,rating
FROM film
WHERE rating = 'G'
LIMIT 5;




## Question-13.Find all customers whose first name starts with "a".
SELECT *
FROM customer
WHERE first_name LIKE 'A%';



## Question-14. Find all customers whose first name ends with "a".
SELECT *
FROM customer
WHERE first_name LIKE '%a';




## Question-15. Display the list of first 4 cities which start and end with ‘a’.
SELECT city_id,city, country_id,last_update
FROM city
WHERE city LIKE 'A%' AND city LIKE '%A'
LIMIT 4;



## Question-16.  Find all customers whose first name have "NI" in any position
SELECT *
FROM customer
WHERE first_name LIKE '%NI%';


## Question-17. Find all customers whose first name have "r" in the second position .
SELECT *
FROM customer
WHERE first_name LIKE '_r%';


## Question-18. Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;



## Question-19. Find all customers whose first name starts with "a" and ends with "o".
SELECT *
FROM customer
WHERE first_name LIKE 'A%' AND first_name LIKE '%o';



## Question - 20. Get the films with pg and pg-13 rating using IN operator.
SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');


## Question - 21.Get the films with length between 50 to 100 using between operator.
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;


## Question - 22. Get the top 50 actors using limit operator
SELECT *
FROM actor
LIMIT 50;



## Question - 23.  Get the distinct film ids from inventory table.
SELECT DISTINCT film_id
FROM Inventory;




# Functions
## Basic Aggregate Functions:
### Question 1:Retrieve the total number of rentals made in the Sakila database.
* Hint: Use the COUNT() function.

USE sakila;
SELECT COUNT(*) AS total_rentals
FROM rental;



### Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
* Hint: Utilize the AVG() function.
SELECT AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
FROM rental r
WHERE r.return_date IS NOT NULL;



### Question 3: Display the first name and last name of customers in uppercase.
* Hint: Use the UPPER () function.
SELECT first_name,last_name,UPPER(first_name) AS UFN, UPPER(last_name) AS ULN
FROM customer;



### Question 4:Extract the month from the rental date and display it alongside the rental ID.
* Hint: Employ the MONTH() function.
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;



### Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
* Hint: Use COUNT () in conjunction with GROUP BY.
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;


### Question 6: Find the total revenue generated by each store.
* Hint: Combine SUM() and GROUP BY.
SELECT s.store_id, SUM(f.rental_rate) AS total_revenue
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id;



### Question 7: Determine the total number of rentals for each category of movies.
* Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.

SELECT c.name AS category, COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id;



### Question 8: Find the average rental rate of movies in each language.
* Hint: JOIN film and language tables, then use AVG () and GROUP BY.

SELECT l.name AS language, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.language_id;





# Joins
## Questions 9 - Display the title of the movie, customer s first name, and last name who rented it.
* Hint: Use JOIN between the film, inventory, rental, and customer tables.

SELECT f.title AS movie_title, c.first_name, c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;



## Question 10:-Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
* Hint: Use JOIN between the film actor, film, and actor tables.

SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

SELECT title
FROM film
WHERE title LIKE '%Gone with the Wind%';



## Question 11:-Retrieve the customer names along with the total amount they've spent on rentals.
* Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;



## Question 12:-List the titles of movies rented by each customer in a particular city (e.g., 'London').
* Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

SELECT c.first_name,c.last_name,f.title,ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'  -- Replace with the city of your choice
ORDER BY c.first_name, c.last_name, f.title;



# Advanced Joins and GROUP BY:
## Question 13:-Display the top 5 rented movies along with the number of times they've been rented.
* Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.

SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;




## Question 14:-Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
* Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;




# Windows Function:
## Question- 1. Rank the customers based on the total amount they've spent on rentals.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY spending_rank;



## Question- 2. Calculate the cumulative revenue generated by each film over time.

SELECT f.title AS film_title,p.payment_date,SUM(p.amount) AS daily_revenue,
SUM(SUM(p.amount)) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title, p.payment_date
ORDER BY f.title, p.payment_date;

## Question- 3. Determine the average rental duration for each film, considering films with similar lengths.

SELECT f.title AS film_title,f.rental_duration,
AVG(f.rental_duration) OVER (PARTITION BY f.rental_duration) AS average_rental_duration
FROM film f
ORDER BY f.rental_duration;



## Question- 4. Identify the top 3 films in each category based on their rental counts.

WITH RankedFilms AS (
    SELECT c.name AS category_name,f.title AS film_title,COUNT(r.rental_id) AS rental_count,
	ROW_NUMBER() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS `rank`
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, f.film_id, f.title
)
SELECT category_name,film_title,rental_count
FROM RankedFilms
WHERE `rank` <= 3
ORDER BY category_name, `rank`;



## Question-5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH CustomerRentals AS (
    SELECT c.customer_id,c.first_name,c.last_name,COUNT(r.rental_id) AS total_rentals
    FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
AverageRentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM CustomerRentals
)
SELECT cr.customer_id,cr.first_name,cr.last_name,cr.total_rentals,ar.avg_rentals,(cr.total_rentals - ar.avg_rentals) AS rental_difference
FROM CustomerRentals cr, AverageRentals ar
ORDER BY cr.customer_id;


## Question- 6. Find the monthly revenue trend for the entire rental store over time.

SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
SUM(amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY month;


## Question- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH CustomerSpending AS (
    SELECT c.customer_id,c.first_name,c.last_name,SUM(f.rental_rate) AS total_spending
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    GROUP BY c.customer_id
),
TotalCustomers AS (
    SELECT COUNT(*) AS total_customers
    FROM customer
)
SELECT cs.customer_id,cs.first_name,cs.last_name,cs.total_spending
FROM CustomerSpending cs,TotalCustomers tc
WHERE cs.total_spending >= (
        SELECT total_spending
        FROM 
            (
                SELECT total_spending,
                    NTILE(5) OVER (ORDER BY total_spending DESC) AS spending_rank
                FROM CustomerSpending
            ) ranked_customers
        WHERE spending_rank = 1
        LIMIT 1
    )
ORDER BY cs.total_spending DESC;



## Question- 8. Calculate the running total of rentals per category, ordered by rental count.

WITH CategoryRentals AS (
    SELECT c.name AS category_name,
    COUNT(r.rental_id) AS rental_count
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN inventory i ON fc.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name
)
SELECT category_name,rental_count,
SUM(rental_count) OVER (ORDER BY rental_count) AS running_total
FROM CategoryRentals
ORDER BY rental_count;



## Question- 9. Find the films that have been rented less than the average rental count for their respective categories.

WITH FilmRentalCounts AS (
    SELECT f.film_id,f.title,c.category_id,COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.category_id
),
CategoryAvgRentalCounts AS (
    SELECT category_id,AVG(rental_count) AS avg_rental_count
    FROM FilmRentalCounts
    GROUP BY category_id
)
SELECT fr.film_id,fr.title,fr.rental_count,ca.avg_rental_count,c.name AS category_name
FROM FilmRentalCounts fr
JOIN CategoryAvgRentalCounts ca ON fr.category_id = ca.category_id
JOIN category c ON fr.category_id = c.category_id
WHERE fr.rental_count < ca.avg_rental_count
ORDER BY c.name, fr.rental_count;



## Question- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
DATE_FORMAT(payment_date, '%Y-%m') AS month,
SUM(amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY total_revenue DESC
LIMIT 5;



## Normalisation & CTE
## 1. First Normal Form (1NF):
## a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

Example of violation in the rental table:
Suppose the rental table has the following columns:
*rental_id
*rental_date
*inventory_id
*customer_id
*return_date
*staff_id
*last_update
*movies_rented (list of movies rented in a single transaction)
If the movies_rented column stores multiple movie IDs for a single rental 
transaction (e.g., "1, 2, 5, 7"), this would violate 1NF. The rule of 1NF states that:
Each column must contain atomic values .
Each column must contain values of a single type.
How to normalize it to 1NF:
To normalize this table to 1NF, you need to remove the multi-valued attribute (movies_rented), 
and instead, ensure that each column contains atomic values. Here one way to do this:
Create a new table to represent the many-to-many relationship between rentals and movies:
Create a new table called rental_movies:
rental_id (foreign key from rental)
movie_id (foreign key from movie)
Populate the new table with the relationships between rentals and movies. Each row in this 
new table will represent a unique pairing of a rental and a movie rented in that transaction.
Result after normalization:
rental table would only contain:
rental_id
rental_date
inventory_id
customer_id
return_date
staff_id
last_update
rental_movies table would look like:
rental_id
movie_id
Now, each row in the rental_movies table represents a unique combination of rental and movie, 
and both tables comply with 1NF because all columns have atomic values.
By eliminating multi-valued attributes and ensuring each value in a 
column is indivisible, you would have normalized the database to 1NF.




# 2. Second Normal Form (2NF):
# a. Choose a table in Sakila and describe how you would determine whether it is in 2NF.If it violates 2NF, explain the steps to normalize it.

To determine whether a table is in Second Normal Form (2NF) we must first ensure that the table is in First Normal Form (1NF) 
After that we need to check for partial dependencies which is the main concept in 2NF. 
A table is in 2NF if:
1. It is in 1NF.
2. There are no partial dependencies. This means that no non-prime attribute (non-key attribute) is dependent on a part of a composite primary key. 

i already used rental table for proving 1NF now we use same table for 2NF


Primary Key: `rental_id` 

#### Step 1: Ensure the Table is in 1NF
- If the table contains atomic values and no repeating groups (which is likely in this case), it would already be in 1NF.
#### Step 2: Check for Partial Dependencies
- Lets assume that the table is using a composite primary key, which could be a combination of `rental_id` and `inventory_id`. 
If the primary key were **composite we would need to check whether all non-key columns depend on the entire primary key or just part of it.

#### Example of Partial Dependency:
- Suppose that `staff_id` (the staff member who processed the rental) depends only on `rental_id`, and not on `inventory_id`. 
This would be a partial dependency, violating 2NF.
In this case, `staff_id` is a non-prime attribute (non-key attribute), and it should depend on the entire primary key. 
If it depends only on part of the composite key (in this case, `rental_id`), it violates 2NF.

#### Step 3: Normalize the Table to 2NF
To normalize the `rental` table to 2NF, you would follow these steps:

1. Remove Partial Dependencies:
   - Move the `staff_id` column (which depends only on `rental_id`) to a separate table, such as `rental_staff`

   - In this new table, the `rental_id` is the primary key, and `staff_id` is fully dependent on it.


   - Now, `rental_date`, `inventory_id`, `customer_id`, `return_date`, and `last_update` all depend on the full composite key (if its composite) 
   or just `rental_id` if its a simple primary key.

### Summary of the Normalization Process:

1. Ensure the table is in 1NF .
2. Identify any partial dependencies.
3. Move attributes with partial dependencies to separate tables.
4. Ensure that all non-key attributes are fully dependent on the entire primary key.
Now the table becomes 2NF.





### 3. Third Normal Form (3NF):
 # a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
 
Answer:
Table Identified: film table
Transitive Dependency in film Table:
The film table contains the following columns:
film_id (Primary Key)
language_id (Foreign Key)
language_name (Non-key attribute dependent on language_id)
The transitive dependency arises because:
language_name depends on language_id (non-key → non-key).
language_id is linked to film_id (foreign key relationship), 
creating an indirect dependency where language_name depends on film_id through language_id.
Steps to Normalize film Table to 3NF:
Ensure the table is in 2NF:
The film table is already in 2NF, assuming film_id is the primary key.
Remove the Transitive Dependency:
Move the language_name column to a new table where language_id is the primary key, 
eliminating the dependency on film_id.
-- Create a New language Table:
-- Create a language table with columns:
language_id (Primary Key)
language_name
-- Update the film Table:
Remove the language_name column from the film table.
Ensure that film only contains the relevant columns dependent on film_id.
Result After Normalization:
The film table is now free from the transitive dependency between language_name and film_id, and it is in Third Normal Form (3NF).
The language table now stores language details with language_id as the primary key, and film references it via the language_id foreign key.




-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

Lets go through the normalization process using the Sakila database, which is a sample database commonly used to demonstrate SQL queries and relational database concepts. 
Well take one of the tables and normalize it step by step from UNF (Unnormalized Form)** to **2NF (Second Normal Form).

For this example, let’s use the `rental` table from Sakila, which might look something like this in its unnormalized form (UNF):

### 1. Unnormalized Form (UNF)
In this stage, the table may have repeating groups or columns with multiple values in a single cell. For example:

| rental_id | rental_date          | customer_id | customer_name  | movie_title            | rental_duration | payment_amount |
|-----------|----------------------|-------------|----------------|------------------------|-----------------|----------------|
| 1         | 2024-12-20 14:30:00  | 100         | John Doe       | The Matrix, Inception  | 7               | 9.99           |
| 2         | 2024-12-20 15:00:00  | 101         | Jane Smith     | The Matrix             | 7               | 9.99           |

- Notice how the `movie_title` field contains multiple values (e.g., "The Matrix" and "Inception") for a single `rental_id`.
- The **customer_name** is stored along with `customer_id`, violating normalization rules.

### 2. First Normal Form (1NF)
In 1NF, each column must contain atomic values (i.e., no multiple values in one field), and each record must be unique. 
To achieve 1NF, we will separate repeating groups into individual rows:

| rental_id | rental_date          | customer_id | customer_name  | movie_title            | rental_duration | payment_amount |
|-----------|----------------------|-------------|----------------|------------------------|-----------------|----------------|
| 1         | 2024-12-20 14:30:00  | 100         | John Doe       | The Matrix             | 7               | 9.99           |
| 1         | 2024-12-20 14:30:00  | 100         | John Doe       | Inception              | 7               | 9.99           |
| 2         | 2024-12-20 15:00:00  | 101         | Jane Smith     | The Matrix             | 7               | 9.99           |

- The repeating group in movie_title is now split, so each row has only a single movie.
- The table is now in 1NF, but there is still redundancy .

### 3. Second Normal Form (2NF)
In 2NF, the table must first be in 1NF, and there should be no partial dependency.

- In this case, the customer_name depends only on `customer_id`, not on the entire composite key (rental_id + movie_title). 
This is a partial dependency, which we need to eliminate.

To achieve 2NF, we can decompose the table into two tables:

#### Rental Table (stores rental-related data):

| rental_id | rental_date          | customer_id | movie_title            | rental_duration | payment_amount |
|-----------|----------------------|-------------|------------------------|-----------------|----------------|
| 1         | 2024-12-20 14:30:00  | 100         | The Matrix             | 7               | 9.99           |
| 1         | 2024-12-20 14:30:00  | 100         | Inception              | 7               | 9.99           |
| 2         | 2024-12-20 15:00:00  | 101         | The Matrix             | 7               | 9.99           |

#### Customer Table (stores customer details):

| customer_id | customer_name  |
|-------------|----------------|
| 100         | John Doe       |
| 101         | Jane Smith     |

- Now, the rental_id and customer_id make up a unique identifier for the rental records, 
and customer-specific information (like name) is stored separately in the Customer table.
- Movie titles are still stored in the Rental table, but we would likely normalize further to create a Movie table if needed.

Thus, we have normalized the original Rental table to 2NF.

### Summary of the Normalization Process:
1. UNF (Unnormalized Form): Multiple values in a single field and data redundancy.
2. 1NF (First Normal Form): Split repeating groups into individual rows, but still have partial dependencies.
3. 2NF (Second Normal Form): Removed partial dependencies by creating a new Customer table and storing customer information separately.

At this point, we have successfully normalized the table up to 2NF. If we wanted to further normalize, we could continue to 3NF, where we remove transitive dependencies (if any exist).






-- 5. CTE Basics:
-- a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.

WITH ActorFilmCount AS (
    SELECT a.actor_id,CONCAT(a.first_name, ' ', a.last_name) AS actor_name,COUNT(fa.film_id) AS film_count
    FROM actor a
    LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT actor_name,film_count
FROM ActorFilmCount
ORDER BY actor_name;





-- 6. CTE with Joins:
-- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.

WITH FilmLanguageCTE AS (
    SELECT f.title AS film_title,l.name AS language_name,f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM FilmLanguageCTE;




-- 7. CTE for Aggregation:
-- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.

WITH CustomerRevenueCTE AS (
    SELECT c.customer_id,c.first_name,c.last_name,SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT * FROM CustomerRevenueCTE;






-- 8. CTE with Window Functions:
-- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

WITH FilmRankCTE AS (
    SELECT title,rental_duration,
	RANK() OVER (ORDER BY rental_duration DESC) AS rental_rank
    FROM film
)
SELECT * FROM FilmRankCTE;




-- 9. CTE and Filtering:
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.

WITH CustomerRentalCountCTE AS (
    SELECT c.customer_id,COUNT(p.payment_id) AS rental_count
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(p.payment_id) > 2
)
SELECT c.customer_id,c.first_name,c.last_name,c.email,c.address_id,crc.rental_count
FROM customer c
JOIN CustomerRentalCountCTE crc ON c.customer_id = crc.customer_id;





-- 10. CTE for Date Calculations:
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.

WITH MonthlyRentalsCTE AS (
    SELECT 
        EXTRACT(YEAR FROM rental_date) AS rental_year,
        EXTRACT(MONTH FROM rental_date) AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM 
        rental
    GROUP BY 
        EXTRACT(YEAR FROM rental_date), EXTRACT(MONTH FROM rental_date)
)
SELECT 
    rental_year,
    rental_month,
    total_rentals
FROM 
    MonthlyRentalsCTE
ORDER BY 
    rental_year, rental_month;
    
    


-- 11. CTE and Self-Join:
-- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.

WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        f.film_id,
        f.title AS movie_name,
        CONCAT(a1.first_name, ' ', a1.last_name) AS actor1_name,
        CONCAT(a2.first_name, ' ', a2.last_name) AS actor2_name
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
    JOIN 
        actor a1 ON fa1.actor_id = a1.actor_id
    JOIN 
        actor a2 ON fa2.actor_id = a2.actor_id
    JOIN 
        film f ON fa1.film_id = f.film_id
)

SELECT 
    actor1_name,
    actor2_name,
    movie_name,  
    film_id
FROM 
    ActorPairs
ORDER BY 
    actor1_name, actor2_name;
    





-- 12. CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column

WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: Get the direct reports of the manager (e.g., staff_id = 1)
    SELECT
        staff_id,
        first_name,
        last_name,
        email,
        store_id,
        active,
        username
    FROM
        staff
    WHERE
        manager_id = 1

    UNION ALL

    -- Recursive member: Get employees who report to the current staff member
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.email,
        s.store_id,
        s.active,
        s.username
    FROM
        staff s
    INNER JOIN EmployeeHierarchy eh
        ON s.manager_id = eh.staff_id
)
SELECT
    staff_id,
    first_name,
    last_name,
    email,
    store_id,
    active,
    username
FROM
    EmployeeHierarchy;


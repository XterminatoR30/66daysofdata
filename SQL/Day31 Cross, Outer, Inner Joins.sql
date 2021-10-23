SELECT DATABASE();
show databases;
USE customers;
DESC customer;

SELECT * FROM orders;
SELECT * FROM orders WHERE customer_id=1;

-- Subqueries to find values in different tables 
SELECT * FROM orders WHERE customer_id=
(SELECT id FROM customer WHERE last_name='George');

-- Cross Joins (Pretty Useless)
-- Joining every customer with every orders   
SELECT * FROM customer,orders;

-- Inner Joins (Implicit Inner Join)
-- customer.id <- Means id inside the customer table 
-- order.customer_id <- Means customer id inside the order table 
SELECT first_name,last_name,order_date,amount FROM customer,orders WHERE customer.id=orders.customer_id;

-- Explicit Inner Joins
-- Foreign Key matching Primary Key in another table 
SELECT first_name,last_name,order_date,amount FROM customer JOIN orders ON customer.id=orders.customer_id; 
SELECT first_name,last_name,order_date,amount FROM customer JOIN orders ON customer.id=orders.customer_id ORDER BY amount;

SELECT customer_id,CONCAT(first_name,' ',last_name) AS full_name,SUM(amount) AS total_spent FROM customer JOIN orders ON customer.id=orders.customer_id GROUP BY orders.customer_id ORDER BY total_spent DESC;

-- Left Joins
-- Select everything from A along with matching records in B
SELECT CONCAT(first_name,' ',last_name) AS full_name,IFNULL(SUM(amount),0) AS total_amount FROM customer LEFT JOIN orders ON customer.id=orders.customer_id GROUP BY orders.customer_id ORDER BY total_amount DESC;

-- Right Joins  
-- Select everything from B, along with any matching records in A
SELECT CONCAT(first_name,' ',last_name) AS full_name,order_date,amount FROM customer RIGHT JOIN orders ON customer.id=orders.customer_id;

-- On Delete Cascade
-- If a value/ multiple values get deleted on a table, the value on the other table get deleted too

-- Exercise
CREATE DATABASE student_paper;
USE student_paper; 
CREATE TABLE students(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
PRIMARY KEY(id));

CREATE TABLE papers(
title VARCHAR(100) NOT NULL,
grade INT NOT NULL,
student_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES students(id));

DESC papers;
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM papers;
SELECT * FROM students;

-- Inner JOIN 
SELECT first_name,title,grade FROM students INNER JOIN papers ON papers.student_id=students.id ORDER BY grade DESC;

-- Left JOIN
SELECT first_name,title,grade FROM students LEFT JOIN papers ON papers.student_id=students.id;

-- IFNULL
SELECT first_name,IFNULL(title,'MISSING') AS title,IFNULL(grade,0) AS grade FROM students LEFT JOIN papers ON papers.student_id=students.id; 

-- AVG
SELECT first_name, AVG(grade) AS average FROM students LEFT JOIN papers ON papers.student_id=students.id GROUP BY first_name ORDER BY average DESC; 

-- Case Statements
SELECT first_name,AVG(grade) AS average, 
CASE WHEN AVG(grade)>75 THEN 'PASSING'
ELSE 'FAILING' END AS passing_status 
FROM students LEFT JOIN papers ON papers.student_id=students.id
GROUP BY first_name
ORDER BY average DESC;  
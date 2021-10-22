-- One to One (One Customer is associated with 1 row of data)
-- One to Many (Very Common, Books has many Reviews, but Reviews has only 1 Book)
-- Many to Many (Books can have many Authors, Authors can have many Books)

-- Customer & Order
-- Customer's first and last name, email
-- Date of purchase & price of order   

CREATE DATABASE customers;
CREATE DATABASE orders;
USE customers;

CREATE TABLE customer(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
PRIMARY KEY(id));

DESC customer;
INSERT INTO customer (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

SELECT * FROM customer;
USE customers;

CREATE TABLE orders(
id INT NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
amount DECIMAL(8,2) NOT NULL,
customer_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(customer_id) REFERENCES customer(id));

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

SELECT * FROM orders;

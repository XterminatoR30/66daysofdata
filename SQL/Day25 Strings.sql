CREATE DATABASE book_shop;
USE book_shop;
SELECT database();
SHOW TABLES;
DESC books;
SELECT * FROM books;
SELECT CONCAT(author_fname,' ',author_lname) FROM books;
SELECT CONCAT(author_fname,' ',author_lname) AS full_name FROM books;
SELECT author_fname AS first_name, author_lname AS last_name,
CONCAT(author_fname,' ',author_lname) AS full_name FROM books;

SELECT CONCAT_WS(' - ',title,author_fname,author_lname) AS Title_Author FROM books;
SELECT title FROM books;
SELECT SUBSTRING(title,1,10) AS first_10books_character FROM books;

SELECT CONCAT(SUBSTRING(title,1,10),'...') AS short_title FROM books;
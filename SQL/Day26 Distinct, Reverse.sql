SELECT database();
SELECT REPLACE('Hello World','l',7) AS replacee;
SELECT REPLACE('cheese bread coffee milk',' ','and') AS grocery_shopping;

SELECT * FROM books;
SELECT REPLACE(title,'e','3') AS title FROM books;
SELECT REPLACE(title,'e','3') AS title FROM books;
SELECT SUBSTRING(REPLACE(title,'e','3'),1,10) AS randomm FROM books;

SELECT REVERSE('Hello World');
SELECT * FROM books;
SELECT CONCAT(author_fname,REVERSE(author_fname)) AS author_reversed FROM books;
SELECT CHAR_LENGTH('Hello World');
SELECT author_lname, CHAR_LENGTH(author_lname) AS length FROM books;
SELECT CONCAT(author_lname," is ",CHAR_LENGTH(author_lname)," characters long") AS name_length FROM books;

SELECT UPPER(author_fname), LOWER(author_lname) FROM books;
SELECT CONCAT(UPPER("my favorite book is"),' ',UPPER(title)) AS book_title FROM books; 

INSERT INTO books(title,author_fname,author_lname,released_year,stock_quantity,pages)
VALUES('10% happier','Dan','Harris',2014,29,256),
('fake_book','Freida','Harris',2001,287,428),
('Lincoln In The Bardo','George','Saunders',2017,1000,367);

SELECT * FROM books;
SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ',author_lname) AS author_names FROM books;

SELECT DISTINCT author_fname,author_lname FROM books;
SELECT * FROM books;
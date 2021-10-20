SELECT COUNT(*) AS no_of_rows FROM books;
SELECT COUNT(DISTINCT author_fname) AS count_author FROM books;
SELECT COUNT(DISTINCT CONCAT(author_fname,author_lname)) AS all_authors FROM books;
SELECT COUNT(title) AS title FROM books WHERE title LIKE"%the%";

SELECT title, author_lname FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) AS count FROM books GROUP BY author_lname;
SELECT author_fname,author_lname,COUNT(*) AS count FROM books GROUP BY author_lname,author_fname;
SELECT released_year,COUNT(*) FROM books GROUP BY released_year;

SELECT MIN(released_year) AS min_year FROM books;
SELECT MAX(pages) AS max_pagenum FROM books;

SELECT * FROM books WHERE pages=(SELECT MIN(pages) FROM books);
SELECT * FROM books WHERE pages=(SELECT MAX(pages) FROM books);

SELECT * FROM books ORDER BY pages LIMIT 1;
SELECT author_fname,author_lname,MIN(released_year) AS min_year FROM books GROUP BY author_lname,author_fname ORDER BY min_year;
SELECT author_fname,author_lname,MAX(pages) AS pages FROM books GROUP BY author_lname,author_fname ORDER BY pages;

SELECT CONCAT(author_fname,' ',author_lname) AS 'author', MAX(pages) AS 'longest_pages(s)' FROM books GROUP BY author_lname,author_fname;

SELECT SUM(pages) FROM books;
SELECT author_fname,author_lname,SUM(pages) AS sum FROM books GROUP BY author_lname,author_fname ORDER BY sum;
SELECT title,AVG(released_year) FROM books GROUP BY title;
SELECT title,released_year,AVG(stock_quantity) FROM books GROUP BY released_year ORDER BY released_year;
SELECT author_fname,author_lname,AVG(pages) FROM books GROUP BY author_lname,author_fname;

SELECT COUNT(*) AS stock FROM books;
SELECT released_year,COUNT(*) FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT author_fname,author_lname,AVG(released_year) FROM books GROUP BY author_lname,author_fname;
SELECT CONCAT(author_fname,' ',author_lname) AS author_fullname,pages FROM books WHERE pages=(SELECT MAX(pages) FROM books);
SELECT pages,CONCAT(author_fname,' ',author_lname) AS author_fullname FROM books ORDER BY pages DESC;

SELECT released_year AS year,COUNT(*) AS '# books',AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year;
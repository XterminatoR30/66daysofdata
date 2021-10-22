SELECT DATABASE();
USE book_shop;
DESC books;

--  Not Equal (!=)
SELECT title,released_year FROM books WHERE released_year!=2017 ORDER BY released_year;
SELECT title,author_lname FROM books WHERE author_lname!='harris';

-- Not Like (NOT LIKE '%W%')
SELECT title FROM books WHERE title LIKE"w%";
SELECT title FROM books WHERE title NOT LIKE 'W%';
SELECT author_fname,author_lname,title FROM books WHERE author_lname NOT LIKE '%lahiri%';

-- Greater Than (>)
-- Greater Than Equal to (>=)
-- 1=True, 0= False
SELECT * FROM books WHERE released_year>2000 ORDER BY released_year; 
SELECT title,stock_quantity FROM books WHERE stock_quantity>=100 ORDER BY stock_quantity;

SELECT 99>1;
SELECT 100>15;
SELECT -15>15;
SELECT 1>1;
SELECT 'a'>'b';
SELECT 'A'>'a';

-- Less Than (<)
-- Less Than or Equal to (<=) 
SELECT title,released_year FROM books WHERE released_year < 2000 ORDER BY released_year; 
SELECT title,stock_quantity FROM books WHERE stock_quantity <=100 ORDER BY stock_quantity;

-- Logical And (&&),(AND)
-- Condition 1 && Condition 2 (ALL CONDITIONS MUST BE TRUE) 
SELECT title,CONCAT(author_fname,' ',author_lname)AS author_name,released_year FROM books WHERE author_lname='Eggers' && released_year>2010 ORDER BY released_year; 
SELECT 1<5 && 7=9;
SELECT -10>-20 && 0<=0;

SELECT * FROM books WHERE author_lname='Eggers' AND released_year>2010 AND title LIKE '%novel%';

-- Logical OR (||), (OR) Either might be true or only 1 CONDITION MUST BE TRUE
-- Condition 1 || Condition 2 (One or Both of the CONDITIONS MUST BE TRUE) 
SELECT title,CONCAT(author_fname,' ',author_lname) AS author_name,released_year FROM books WHERE author_lname='Eggers' OR released_year>2010 ORDER BY released_year;
SELECT 40<=100 || -2>0;
SELECT 10>5 || 5=5;
SELECT title,CONCAT(author_fname,' ',author_lname) AS author_name,released_year,stock_quantity FROM books WHERE author_lname='Eggers' OR released_year>2010 OR stock_quantity>100 ORDER BY released_year;

-- BETWEEN
-- NOT BETWEEN 
SELECT * FROM books WHERE released_year>=2004 AND released_year<=2015 ORDER BY released_year;
SELECT title,released_year FROM books WHERE released_year BETWEEN 2004 AND 2015 ORDER BY released_year; 

SELECT title,released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year; 
SELECT CAST('2021-10-22' AS DATETIME) AS datetimes;

USE datetimes;
SHOW TABLES;
SELECT name,birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

-- In & Not In
USE book_shop;
DESC books;
SELECT title,author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' || author_lname='Smith';

SELECT title,author_lname FROM books WHERE author_lname IN('Carver','Lahiri','Smith');
SELECT title,released_year FROM books WHERE released_year NOT IN('2000','2002','2004','2006','2008','2010','2012','2014','2016') ORDER BY released_year;
SELECT title,released_year FROM books WHERE released_year>=2000 AND released_year NOT IN('2000','2002','2004','2006','2008','2010','2012','2014','2016') ORDER BY released_year;

-- Modulo (%)
SELECT title,released_year FROM books WHERE released_year>=2000 AND released_year%2!=0 ORDER BY released_year DESC; 

-- CASE Statement 
SELECT title,released_year,
CASE WHEN released_year >=2000 THEN 'Modern Lit'
ELSE '20th Century Lit'
END AS GENRE FROM books ORDER BY released_year DESC;

SELECT title,stock_quantity,
CASE WHEN stock_quantity<50 THEN '*'
WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
ELSE '***'
END AS STOCK FROM books ORDER BY stock_quantity;
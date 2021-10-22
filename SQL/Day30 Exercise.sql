SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
SELECT 10!=10;
SELECT 15>14 &&99-5<=94;

SELECT title,released_year FROM books WHERE released_year<1980 ORDER BY released_year;
SELECT title,CONCAT(author_fname,' ',author_lname) AS author FROM books WHERE author_lname IN('Eggers','Chabon') ORDER BY author;
SELECT title,CONCAT(author_fname,' ',author_lname) AS author, released_year FROM books WHERE author_lname='Lahiri' AND released_year>2000;
SELECT title,pages FROM books WHERE pages BETWEEN 100 AND 200;
SELECT title,author_lname FROM books WHERE author_lname LIKE 'C%' OR 'S%'; 

SELECT title,author_lname,
CASE WHEN title LIKE '%stories%' THEN 'Short Stories'
WHEN title='Just Kids' OR title='A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
ELSE 'Novel' END AS book_types FROM books;

SELECT title,author_fname,author_lname, 
CASE WHEN COUNT(*)=1 THEN '1 book'
ELSE CONCAT(COUNT(*),' ','books')
END AS COUNT
FROM books GROUP BY author_lname,author_fname ORDER BY author_lname;
SELECT title FROM books WHERE title LIKE "%stories%";
SELECT title,pages FROM books WHERE pages ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title,' - ',released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title,author_lname FROM books WHERE author_lname LIKE "%% %";
SELECT title,released_year,stock_quantity FROM books WHERE stock_quantity ORDER BY stock_quantity;
SELECT title,author_lname FROM books ORDER BY author_lname,title;
SELECT UPPER(CONCAT('my favorite author is ',' ',author_lname,'!')) AS yell FROM books ORDER BY author_lname; 

SELECT title AS unreviewed_series FROM series LEFT JOIN reviews ON series.id=reviews.series_id WHERE rating IS NULL;

SELECT genre,ROUND(AVG(rating),2) AS avg_rating FROM series INNER JOIN reviews ON series.id=reviews.series_id GROUP BY genre ORDER BY genre;

SELECT first_name,
last_name,
COUNT(rating) AS 'COUNT',
MIN(IFNULL(rating,0)) AS 'MIN',
MAX(IFNULL(rating,0)) AS 'MAX',
AVG(IFNULL(rating,0)) AS 'AVG',
CASE WHEN rating BETWEEN 1 AND 10 THEN 'ACTIVE'
ELSE 'INACTIVE' END AS 'STATUS'
FROM reviewers LEFT JOIN reviews ON reviewers.id=reviews.reviewer_id
GROUP BY first_name,last_name;

SELECT first_name,
last_name,
COUNT(rating) AS 'COUNT',
MIN(IFNULL(rating,0)) AS 'MIN',
MAX(IFNULL(rating,0)) AS 'MAX',
AVG(IFNULL(rating,0)) AS 'AVG',
IF(COUNT(rating) BETWEEN 1 AND 10,'ACTIVE','INACTIVE') AS 'STATUS'
FROM reviewers LEFT JOIN reviews ON reviewers.id=reviews.reviewer_id
GROUP BY first_name,last_name;

SELECT title,
rating,
CONCAT(first_name,' ',last_name) AS reviewer
FROM series INNER JOIN reviews ON series.id=reviews.series_id
INNER JOIN reviewers ON reviewers.id=reviews.reviewer_id ORDER BY title;

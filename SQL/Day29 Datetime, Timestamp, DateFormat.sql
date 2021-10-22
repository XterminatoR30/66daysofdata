-- DATE,TIME,DATETIME,TIMESTAMP,CURDATE,CURTIME,NOW,DATE_FORMAT

CREATE DATABASE datetimes;
USE datetimes;
CREATE TABLE people(
name VARCHAR(100),
birthdate DATE,
birthtime TIME,
birthdt DATETIME);

INSERT INTO people(name,birthdate,birthtime,birthdt)
VALUES ('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35');

INSERT INTO people(name,birthdate,birthtime,birthdt)
VALUES ('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');
SELECT * FROM people;

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people(name,birthdate,birthtime,birthdt)
VALUES('Microwave',CURDATE(),CURTIME(),NOW());
SELECT * FROM people;

SELECT name,birthdate,DAYNAME(birthdate),DAYOFWEEK(birthdate),DAYOFYEAR(birthdate) FROM people;
SELECT name,birthdt,MONTHNAME(birthdt) FROM people;

SELECT name,CONCAT(MONTHNAME(birthdate),' ',DAY(birthdate),' ',YEAR(birthdate)) AS birthdate FROM people;
SELECT name,DATE_FORMAT(birthdate,'%M %e %Y') AS birthdate FROM people;
SELECT name,DATE_FORMAT(birthdate,'%d/%m/%Y') AS birthdate FROM people;

SELECT DATEDIFF(CURDATE(),birthdate) AS days_diff FROM people;
SELECT birthdt,DATE_ADD(birthdt, INTERVAL 1 MONTH) AS added_month FROM people;
SELECT birthdt,DATE_ADD(birthdt, INTERVAL 30 SECOND) AS added_time FROM people;

SELECT birthdt,birthdt+INTERVAL 3 MONTH AS added_month FROM people;
SELECT birthdt,birthdt-INTERVAL 4 MONTH AS subtracted_month FROM people;

-- EXERCISE 
CREATE TABLE comments(
content VARCHAR(100),
created_at TIMESTAMP DEFAULT NOW());

DESC comments;
INSERT INTO comments(content)
VALUES('Lol what a funny article'),
('I found this offensive');

SELECT * FROM comments;

CREATE TABLE comments2(
content VARCHAR(100),
created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO comments2(content)
VALUES('Lol what a funny article'),
('I found this offensive');
SELECT * FROM comments;

UPDATE comments2 SET content="Hello there" WHERE content='Lol what a funny article';
SELECT * FROM comments2;

CREATE TABLE inventory(
item_name VARCHAR(100),
price DOUBLE(7,2),
quantity INT);

DESC inventory;

SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');
SELECT DATE_FORMAT(NOW(),'%M %D at %h:%i');
CREATE TABLE tweets(
content VARCHAR(140),
uname CHAR(20),
created_time DATETIME);
DESC tweets;

CREATE TABLE tweets2(
content VARCHAR(140),
uname CHAR(20),
created_time TIMESTAMP DEFAULT NOW());

INSERT INTO tweets2(content,uname)
VALUES('Hello there my name is Kevin','abcdefg');

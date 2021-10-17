CREATE DATABASE cats_app;
USE cats_app;
CREATE TABLE cats(
cat_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
breed VARCHAR(100) NOT NULL,
age INT NOT NULL,
PRIMARY KEY(cat_id));
DESC cats;
INSERT INTO cats(name,breed,age)
VALUES('Ringo','Tabby',4),
('Cindy','Maine Coon',10),
('Dumbledore','Maine Coon',11),
('Egg','Persian',4),
('Misty','Tabby',13),
('George Michael','Ragdoll',9),
('Jackson','Shynx',7);

SELECT * FROM cats;
SELECT name FROM cats;
SELECT age FROM cats;
SELECT name,age FROM cats;
SELECT name,age,breed FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Egg';
SELECT cat_id FROM cats;
SELECT name,breed FROM cats;
SELECT name,age FROM cats WHERE breed='Tabby';
SELECT cat_id,age FROM cats WHERE cat_id=age;
SELECT * FROM cats WHERE cat_id=age;
SELECT cat_id AS id, name FROM cats;
SELECT name AS cat_name, breed AS kitty_breed FROM cats;
SELECT * FROM cats;

USE cats_app;
UPDATE cats SET breed='Shorthair'
WHERE breed='Tabby';
SELECT * FROM cats;

UPDATE cats SET age=14
WHERE name='Misty';
SELECT * FROM cats;

UPDATE cats SET name='Jack'
WHERE name='Jackson';
SELECT * FROM cats;

UPDATE cats SET breed='British Shorthair'
WHERE name='Ringo';
SELECT * FROM cats;

UPDATE cats SET age=12
WHERE breed='Maine Coon';
SELECT * FROM cats;

DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats;

DELETE FROM cats WHERE age=4;
SELECT * FROM cats;

DELETE FROM cats WHERE age=cat_id;
SELECT * FROM cats;

DELETE FROM cats;
SELECT * FROM cats;
-- Trigger time: BEFORE AFTER
-- Trigger event: INSERT UPDATE DELETE
-- Table name: users   

-- PREVENTING AGE <18 TO ENTER 
show databases;
CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users(
username VARCHAR(100) NOT NULL,
age INT NOT NULL);

INSERT INTO users(username,age)
VALUES("bobby",43);

SELECT * FROM users;

DELIMITER $$
CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age <18
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT='Must be an adult';
		END IF;
	END;
$$ 
DELIMITER ;

INSERT INTO users(username,age)
VALUES ("Sue",54);

INSERT INTO users(username,age)
VALUES("Yang",14);

SELECT * FROM users;

-- PREVENTING SELF FOLLOWING INSTAGRAM DATA 
USE instagram;

DELIMITER $$
CREATE TRIGGER cant_follow_self
	BEFORE INSERT ON follows FOR EACH ROW
	BEGIN
		IF NEW.follower_id=NEW.followee_id
        THEN
			SIGNAL SQLSTATE'45000'
				SET MESSAGE_TEXT="Can't Follow Yourself!";
		END IF;
	END;
$$
DELIMITER ;

SELECT * FROM follows;
SHOW TABLES;
INSERT INTO follows(follower_id,followee_id)
VALUES(4,4);

-- LOGGING UNFOLLOWS INSTAGRAM 
CREATE TABLE UNFOLLOWS(
follower_id INT NOT NULL,
followee_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW() NOT NULL,
FOREIGN KEY(follower_id) REFERENCES USERS(id),
FOREIGN KEY(followee_id) REFERENCES USERS(id),
PRIMARY KEY(follower_id,followee_id));

SHOW TABLES;

DELIMITER $$
CREATE TRIGGER create_unfollow
	AFTER DELETE ON follows FOR EACH ROW
    BEGIN
		INSERT INTO unfollows
        SET follower_id= OLD.follower_id,
			followee_id= OLD.followee_id;
	END
$$
DELIMITER ;

SHOW TRIGGERS;
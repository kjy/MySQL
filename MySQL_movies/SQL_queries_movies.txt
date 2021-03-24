SHOW databases;
USE movie_buff;

CREATE TABLE IF NOT EXISTS movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director VARCHAR(80)
);

CREATE TABLE directors (
   director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(40),
   last_name VARCHAR(40),
   country VARCHAR(80)
);

DROP TABLE movies;

-- recreate the movies table
-- foreign key references primary key in another table
CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

SELECT * FROM movie_buff.movies;
SELECT title FROM movies;

SELECT * FROM movie_buff.movies;

SELECT title, year_released
FROM movies
ORDER BY title DESC;

SELECT * FROM directors
ORDER BY country ASC;

SELECT * FROM directors
ORDER BY country ASC, last_name ASC;

INSERT INTO directors (first_name, last_name, country)
VALUES ("Rob", "Reiner", "USA");

SELECT last_name, director_id FROM directors
WHERE first_name = 'Rob';

SELECT last_name, director_id FROM directors
WHERE first_name = 'Rob' 
AND country='USA';

INSERT INTO movies (title, year_released, director_id)
VALUES ("Princess Bride", 1987, 11);

SELECT title, year_released, last_name
FROM movies
INNER JOIN directors
ON movies.director_id = directors.director_id;

SELECT first_name, last_name
FROM movies
INNER JOIN directors
ON movies.director_id = directors.director_id
WHERE title='THe Incredibles';

SELECT last_name, country
FROM movies
INNER JOIN directors
ON movies.director_id = directors.director_id
AND title = 'Roma';

DELETE FROM movies
WHERE movie_id=1;

-- Error code 1451.  Cannot delete or update a parent row: a foreign key constraint fails
DELETE FROM directors
WHERE director_id=11;

-- Use aliases, select a column with a temporary name
SELECT first_name AS 'First Name'
FROM directors;

-- List all movies directed by Peter Jackson
SELECT title
FROM movies
INNER JOIN directors
ON movies.director_id = directors.director_id
WHERE first_name='Peter'
AND last_name='Jackson';

-- Add a new column for amount of money earned, to the movie table
ALTER TABLE movies
ADD amount_money_earned DOUBLE;

-- Update movies in the table to have an amount money earned
UPDATE movies
SET amount_money_earned = 12345678.90
WHERE movie_id=5;

UPDATE movies
SET amount_money_earned = 1.00
WHERE movie_id=2;
UPDATE movies
SET amount_money_earned = 2.00
WHERE movie_id=3;
UPDATE movies
SET amount_money_earned = 3.00
WHERE movie_id=4;
UPDATE movies
SET amount_money_earned = 4.00
WHERE movie_id=7;
UPDATE movies
SET amount_money_earned = 5.00
WHERE movie_id=8;

UPDATE movies
SET amount_money_earned = 6.00
WHERE movie_id=9;

UPDATE movies
SET amount_money_earned = 7.00
WHERE movie_id=10;

UPDATE movies
SET amount_money_earned = 8.00
WHERE movie_id=11;

UPDATE movies
SET amount_money_earned = 9.00
WHERE movie_id=12;

UPDATE movies
SET amount_money_earned = 10.00
WHERE movie_id=13;

UPDATE movies
SET amount_money_earned = 11.00
WHERE movie_id=14;

UPDATE movies
SET amount_money_earned = 12.00
WHERE movie_id=15;

UPDATE movies
SET amount_money_earned = 13.00
WHERE movie_id=16;

UPDATE movies
SET amount_money_earned = 14.00
WHERE movie_id=17;

--Generate a list that ranks the movie based on earnings
SELECT title
FROM movies
ORDER BY amount_money_earned DESC;

-- Generate a list that shows the movie based on earning above 1 million
SELECT title
FROM movies
WHERE amount_money_earned > 1000000;


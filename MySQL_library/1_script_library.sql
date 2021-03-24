USE library;

-- Return the mystery book titles and their ISBNs.
SELECT title, isbn FROM book
INNER JOIN genre
ON book.genre_id = genre.genre_id
WHERE genres = "Mystery";

-- Return all of the titles and author’s first and last names 
-- for books written by authors who are currently living.
SELECT title, first_name, last_name
FROM book
INNER JOIN author
ON author.author_id = book.author_id
WHERE deathday IS NULL;




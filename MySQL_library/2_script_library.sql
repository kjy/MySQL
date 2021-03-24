
SET @book_id:= 3;    # The Golden Compass
SET @patron_id:= 6;  # Tory Less

-- Change available to FALSE for the appropriate book
UPDATE book SET available=false WHERE book_id=@book_id;

-- create an entry in the loan table
INSERT INTO loan(book_id, patron_id, date_out)
VALUES (@book_id, @patron_id, CURRENT_DATE());

-- Update the appropriate patron with the loan_id for the new row created in the loan table
SELECT @loan_id := loan_id
FROM loan
WHERE book_id=@book_id AND date_in IS NULL;

UPDATE patron SET loan_id = @loan_id
WHERE patron_id = @patron_id;

-- ----------------------------
-- check a book back in

SET @book_id:= 3;    # The Golden Compass
SET @patron_id:= 6;  # Tory Less

UPDATE book SET available = true WHERE book_id=@book_id;

SELECT @loan_id:= loan_id
FROM loan
WHERE book_id = @book_id AND date_in IS NULL;

UPDATE loan SET date_in = CURRENT_DATE()
WHERE loan_id = @loan_id;

-- update patron's loan_id back to null
UPDATE patron SET loan_id = NULL
WHERE patron_id = @patron_id;

-- rerun code below, increment by 1 for 5 times
SET @book_id:= 9;    
SET @patron_id:= 12;  

UPDATE book SET available = true WHERE book_id=@book_id;

SELECT @loan_id:= loan_id
FROM loan
WHERE book_id = @book_id AND date_in IS NULL;

UPDATE loan SET date_in = CURRENT_DATE()
WHERE loan_id = @loan_id;

-- update patron's loan_id back to null
UPDATE patron SET loan_id = NULL
WHERE patron_id = @patron_id;

-- return a list of patrons with the genre of book they've checked out
SELECT first_name, last_name, title, genres
FROM loan
INNER JOIN patron
ON loan.patron_id = patron.patron_id
INNER JOIN book
ON loan.book_id = book.book_id
INNER JOIN genre
ON book.genre_id = genre.genre_id
WHERE loan.date_in IS NULL;

-- return the count of the books in each genre
SELECT genres, COUNT(*)
FROM book
INNER JOIN genre
ON book.genre_id = genre.genre_id
GROUP BY genres;

-- keep a reference book from leaving the library, use Triggers
UPDATE book SET available = true WHERE book_id=32;

UPDATE book SET available = false WHERE book_id=32; -- error message: Cannot check this book out!

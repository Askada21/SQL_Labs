
-- ============================================
-- SQL PRACTICE LAB 2 - A LOCAL BOOKSHOP
-- PostgreSQL
-- ============================================

-- PART 0: DATABASE SETUP

CREATE SCHEMA IF NOT EXISTS bookshop_practice;

SET search_path TO bookshop_practice;

CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL
);

INSERT INTO publishers (publisher_id, publisher_name)
VALUES
    (10, 'Penguin Books'),
    (20, 'Oxford Press'),
    (30, 'HarperCollins');

SELECT * FROM publishers;


-- ============================================
-- PART 1: CREATE TABLE AND CONSTRAINTS
-- ============================================

-- Q1: Create the books table

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    author VARCHAR(100),
    publisher_id INT NOT NULL
        REFERENCES publishers(publisher_id)
        ON UPDATE CASCADE
);

SELECT * FROM books;


-- Q2: Explain PRIMARY KEY vs UNIQUE

-- PRIMARY KEY uniquely identifies each row in a table
-- and does not allow NULL or duplicate values.
-- UNIQUE prevents duplicate values in a column,
-- but allows NULL values by default in PostgreSQL.


-- ============================================
-- PART 2: INSERT INTO
-- ============================================

-- Q3: Insert four books

INSERT INTO books
    (book_id, book_title, isbn, price, author, publisher_id)
VALUES
    (1, 'Python Basics', 'B101', 25.00, 'John Smith', 10),
    (2, 'SQL Guide', 'B102', 30.00, NULL, 20),
    (3, 'Data Science', 'B103', 40.00, 'Alice Brown', 30),
    (4, 'Web Development', 'B104', 20.00, 'Mark Wilson', 10);

SELECT * FROM books;


-- ============================================
-- PART 3: SELECT AND STRING FUNCTIONS
-- ============================================

-- Q4: UPPER, LOWER and CONCAT

SELECT
    UPPER(book_title),
    LOWER(isbn),
    CONCAT(book_title, ' - EUR ', price) AS book_label
FROM books;


-- Q5: UNION

SELECT publisher_name AS name
FROM publishers
UNION
SELECT book_title
FROM books;


-- Q6: Find books where author is NULL

SELECT book_title, author
FROM books
WHERE author IS NULL;


-- Q7: Display books with price greater than 25

SELECT book_title, price
FROM books
WHERE price > 25
ORDER BY price DESC;


-- ============================================
-- PART 4: UPDATE AND ALTER TABLE
-- ============================================

-- Q8: Increase all prices by 15%
-- Run only once!

UPDATE books
SET price = price * 1.15;

SELECT price FROM books;


-- Q9: Increase book 2 price by another 10%
-- Run only once!

UPDATE books
SET price = price * 1.10
WHERE book_id = 2;

SELECT book_id, price FROM books;


-- Q10: Add stock_quantity with DEFAULT 0

ALTER TABLE books
ADD COLUMN stock_quantity INT DEFAULT 0;

SELECT stock_quantity FROM books;


-- Q11: Update stock_quantity for book 1

UPDATE books
SET stock_quantity = 15
WHERE book_id = 1;

SELECT book_id, stock_quantity FROM books;


-- ============================================
-- PART 5: FOREIGN KEYS AND CASCADE
-- ============================================

-- Q12: Change publisher_id from 10 to 100

UPDATE publishers
SET publisher_id = 100
WHERE publisher_id = 10;

SELECT *
FROM books
ORDER BY book_id;


-- Q13: Explain ON UPDATE CASCADE

-- ON UPDATE CASCADE automatically updates the
-- foreign key values in the books table when
-- the referenced publisher_id changes.
-- Therefore, books 1 and 4 change from 10 to 100.


-- ============================================
-- PART 6: CONSTRAINTS AND ERROR HANDLING
-- ============================================

-- Q14: Test inserting a negative price
-- Write and test your SQL here.
-- Leave the invalid INSERT commented out.


-- Q15: Test inserting an invalid publisher_id
-- Write and test your SQL here.


-- ============================================
-- BONUS CHALLENGES
-- ============================================

-- Bonus 1: INNER JOIN
-- Display book_title, price and publisher_name.


-- Bonus 2: GROUP BY
-- Display publisher_id and the number of books
-- published by each publisher.


-- Bonus 3: ALTER TABLE
-- Add a constraint named check_stock
-- that prevents negative stock quantities.


-- ============================================
-- FINAL DATA CHECK
-- ============================================

SELECT *
FROM books
ORDER BY book_id;

SELECT *
FROM publishers
ORDER BY publisher_id;

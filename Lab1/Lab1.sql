-- =========================================================
-- SQL Practice Lab 2 – Week 2
-- Module: Introduction to Databases
-- 2026/27
-- Suggested filename: lab2_sql_practice_yourstudentnumber.sql
--
-- Instructions:
-- 1. Insert your answers directly under each question.
-- 2. Use comments (--) for theory answers.
-- 3. Test each query after you write it by highlighting it
--    and pressing Run in your SQL editor.
-- 4. Submit this completed .sql file.
--
-- LAB POLICY: NO GEN AI FOR CODE CREATION
-- =========================================================

SET search_path TO book;


/* ---------------------------------------------------------
   Q1 – Publishers Table: Theory
--------------------------------------------------------- */

-- Q1(a): What is the primary key of the publishers table?
-- Answer: pub_id


-- Q1(b): Does the publishers table contain a foreign key?
-- Answer: No


-- Q1(c): What is the degree of the publishers table?
-- Answer: 5
select * from publishers;

-- Q1(d): What is the domain of pub_name?
-- Use information_schema to confirm.
-- Answer: 20


-- Q1(e): What is the cardinality (number of rows) of the
-- publishers table? Use COUNT(*).
-- Answer: 4
select count(*) from publishers;


/* ---------------------------------------------------------
   Q2 – Titles Table
--------------------------------------------------------- */

-- Q2(1): Write a query to display all rows and columns
-- from the titles table.
select * from titles;


-- Q2(2): Write a query to display only title_id,
-- title_name and price.
select title_id, title_name, price from titles;



-- Q2(3): Write a query to display only title_name and sales.
select title_name, sales from titles;



/* ---------------------------------------------------------
   Q3 – Book Types
--------------------------------------------------------- */

-- Q3(4): Write a query to list all values in the type
-- column, including duplicates.
select type from titles;


-- Q3(5): Write a query to list only the unique book types.
select distinct type from titles;



/* ---------------------------------------------------------
   Q4 – Authors
--------------------------------------------------------- */

-- Q4(6): Write a query to display the first name, last name
-- and phone number of authors who live in San Francisco.
select au_fname, au_lname, phone from authors where city = 'San Francisco';



/* ---------------------------------------------------------
   Q5 – Publishers
--------------------------------------------------------- */

-- Q5(7): Write a query to display the publisher ID and
-- publisher name of publishers located in San Francisco
-- or Berkeley.
select pub_id, pub_name from publishers where city = 'San Francisco' OR city = 'Berkeley';


/* ---------------------------------------------------------
   Q6 – Royalties
--------------------------------------------------------- */

-- Q6(8): Write a query to display title_id and advance
-- where the advance is between 10,000 and 20,000 inclusive.
select * from royalties;
select title_id, advance from royalties where advance between 10000 and 20000;



/* ---------------------------------------------------------
   Q7 – Book Titles
--------------------------------------------------------- */

-- Q7(9): Write a query to display the title ID and book
-- name where the type is either Biography or Psychology.
select * from titles;
select title_id, title_name from titles where type = 'biography' or type = 'psychology';



/* ---------------------------------------------------------
   Q8 – Addresses
--------------------------------------------------------- */

-- Q8(10): Write a query to display all details for authors
-- whose address contains the word Main.
select * from authors;
select address from authors where address like '%Main%';



/* ---------------------------------------------------------
   Q9 – DISTINCT Practice
--------------------------------------------------------- */

-- Q9(11a): List the unique states in which authors live.
select * from authors;
select distinct state from authors; 


-- Q9(11b): Count the number of distinct cities in which
-- authors live.
select distinct count(city) from authors;



/* ---------------------------------------------------------
   Q10 – Pattern Matching (Choose Any Three)
--------------------------------------------------------- */

-- Q10(12a): List authors whose last name starts with K.
select * from authors;
select au_lname from authors where au_lname like '%K%';

-- Q10(12b): List authors whose last name ends with y.



-- Q10(12c): List book titles containing an exclamation
-- mark (!).
select * from titles;
select title_name from titles where title_name like '%!%';

-- Q10(12d): List titles where the price is NULL.
select title_name from titles where price is NULL;

-- Q10(12e): List publishers located in a city beginning
-- with San.


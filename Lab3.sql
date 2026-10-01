-- =========================================================
-- TU Dublin | Introduction to Databases | Week 3 | 2026/27
-- Student: Daria Osypova Student ID: A00028295 
--
-- INSTRUCTIONS
-- Enter your SQL under each question. Run each query and check
-- that it produces the expected result.
--
-- LIVE ASSESSMENT BY TA
-- You must complete ALL questions in this lab.
--
-- When you have completed Q1–Q7, ask the TA to check your work.
-- The TA will randomly select  queries from Q1–Q7 to assess.
--
-- At the end of the lab, the TA will also assess:
--   * ONE join query from Q7–Q9
--   * Q10
--   * Q11
--
-- Do not wait until the end of the lab to have your first
-- set of queries checked.
--
-- LAB POLICY: NO GEN AI FOR CODE CREATION
-- =========================================================

SET search_path TO book;


-- ===== A — Ordering & Pattern Matching =====

-- Q1. List the title name, type and price of all books.
-- Order the results by price from highest to lowest.
-- Write SQL here: 
select title_name, type, price from titles order by price desc;



-- Q2. List the title name, type and number of pages of all books.
-- Order the results alphabetically by type and then by title name
-- in reverse alphabetical order.
-- Write SQL here:
select title_name, type, pages
from titles
order by type asc,title_name asc;



-- Q3. List the title name and price of all books whose title
-- contains 'My'.
-- Hint: Use LIKE for pattern matching.
-- Write SQL here:
select title_name, price
from titles
where title_name like '%My%';



-- ===== B — Aggregate Functions =====

-- Q4. How many books were published before the year 2000?
-- Hint: Compare pubdate with '2000-01-01'.
-- Dates can be written in single quotes in PostgreSQL.
-- Write SQL here:
select count(*) -- How many books? -> 4
from titles
where pubdate <= '2000-01-01';



-- Q5. How many book titles have a price below 15?
-- Write SQL here:
select count(*)
from titles
where price < 15;



-- Q6. Find the total sales and average sales of all book titles.
-- Use the AS keyword to give each calculated column a meaningful name.
-- Write SQL here:
-- 'as' it names the column
select sum(sales) as total_sales, avg(sales) as average_sales
from titles 




-- ===== C — Joins =====

-- Q7. List the title name and publisher name of all books
-- published by publishers located in Berkeley.
-- Hint: The information is in two tables.
-- Both tables contain pub_id, which can be used to join them.
-- Write SQL here:
select t.title_name, p.pub_name
from titles t
join publishers p ON t.pub_id = p.pub_id
where p.city='Berkeley'




-- Q8. List the names of publishers who have published biography
-- books. Each publisher should appear only once.
-- Write SQL here:
select distinct p.pub_name, t.type
from publishers p
join titles t ON p.pub_id = t.pub_id
where type = 'biography'




-- Q9. List the title name, publisher name and price of all books
-- published by publishers in Germany.
-- Order the results by price from highest to lowest.
-- Write SQL here:
select t.title_name, p.pub_name, t.price
from publishers p
join titles t ON p.pub_id = t.pub_id
where p.country = 'Germany'
order by t.price desc



-- ===== D — Grouping & HAVING =====

-- Q10. For each book genre (type), show the genre and the number
-- of books belonging to that genre.
--
-- Hint: GROUP BY puts books of the same type together.
-- Use COUNT(*) to find how many books are in each group.
-- Write SQL here:
select type, count(*)
from titles
group by type 




-- Q11. For each publisher that has published more than three books,
-- display the publisher name and the number of books published.
-- Use AS book_count for the calculated column.
--
-- Hint:
-- JOIN publishers and titles to link each book to its publisher.
-- GROUP BY publisher so that you can COUNT the books for each publisher.
-- Use HAVING rather than WHERE because you are filtering groups
-- based on the number of books published.
-- Write SQL here:
select p.pub_name, count(t.title_name) AS book_count
from publishers p
join titles t ON p.pub_id = t.pub_id
group by p.pub_name
having count(t.title_name) > 3;

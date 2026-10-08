-- =========================================================
-- TU Dublin — Introduction to Databases
-- Lab 4 — SQL JOINs
-- Student Name:
-- Student ID:
--
-- Use INNER JOINs for all questions.
-- =========================================================

SET search_path TO book;


/* =========================================================
   Q1
   List each title and the name of its publisher.
   ========================================================= */

-- Write SQL below here
select t.title_name, p.pub_name
from titles t
join publishers p ON t.pub_id = p.pub_id





/* =========================================================
   Q2
   List each author's first name, last name and the titles
   they have written.
   ========================================================= */

-- Write SQL below here
select a.au_fname, a.au_lname, t.title_name
from authors a
join title_authors ta ON a.au_id = ta.au_id
join titles t ON ta.title_id = t.title_id






-- =========================================================
-- END OF LAB
-- =========================================================

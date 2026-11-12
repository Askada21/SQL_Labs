
set search_path to book;

-- Q2
create table book_reviews (
    review_id integer primary key,
    title_id char(3) not null references titles(title_id),
    reviewer_name varchar(50) not null,
    rating integer not null check (rating between 1 and 5),
    review_date date not null
);

-- Q3
insert into book_reviews
    (review_id, title_id, reviewer_name, rating, review_date)
values
    (1, 'T01', 'Aoife Byrne', 4, '2026-11-01'),
    (2, 'T03', 'Liam Murphy', 5, '2026-11-02'),
    (3, 'T01', 'Niamh Kelly', 3, '2026-11-03');

insert into publishers
    (pub_id, pub_name, city, state, country)
values
    ('P05', 'Liffey Books', 'Dublin', null, 'Ireland');

-- Q4 left join
select p.pub_id, p.pub_name
from publishers p
left join titles t on p.pub_id = t.pub_id
where t.title_id is null;

-- Q5 having and count
select a.au_id, a.au_fname, a.au_lname,
       count(ta.title_id) as title_count
from authors a
join title_authors ta on a.au_id = ta.au_id
group by a.au_id, a.au_fname, a.au_lname
having count(ta.title_id) >= 3
order by title_count desc, a.au_id;

-- Q6 subquery
select title_id, title_name, price
from titles
where price > (
    select avg(price)
    from titles
)
order by price desc, title_id;

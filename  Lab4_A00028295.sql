set search_path to book;

select distinct a.au_fname, a.au_lname
from authors a
join title_authors ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
where p.country = 'Germany'
order by a.au_lname, a.au_fname



select a.au_fname, a.au_lname, t.title_name, p.pub_name, r.royalty_rate
from authors a
join title_authors ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
join royalties r on t.title_id = r.title_id
order by a.au_lname, a.au_fname, t.title_name;


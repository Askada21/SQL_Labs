-- 1. Display the album title, artist name and price of every album.
SELECT album_title, artist_name, price
FROM albums;

-- 2. Display the album title and release year for albums released after 2022.
SELECT album_title, release_year
FROM albums
where release_year > 2022;

-- 3. Display the album title, genre and price for albums priced between €18 and €25 inclusive. Order by price from lowest to highest.
SELECT album_title, genre, price
FROM albums
where price between 18 and 25
order by price asc;

-- 4. Find the total number of customers from Ireland.
select count(*) from customers
where country = 'Ireland';

-- 5. Find the highest album price, lowest album price and average album price. Give each result a meaningful column name.
select max(price) as max, min(price) as min, avg(price) as mean from albums;

-- 6. For each genre, display the genre and the number of albums. Order by number of albums from highest to lowest.
select genre, count(album_id) from albums
group by genre
order by count(album_id) desc;

-- 7. Display the album title, artist name and record label name for albums released by labels based in Dublin.
SELECT a.album_title, a.artist_name, l.label_name
FROM albums a
JOIN labels l ON a.label_id = l.label_id
WHERE l.city = 'Dublin';

-- 8. Display the customer name, album title and quantity for every sale made by customers from Ireland.
select c.customer_name, a.album_title, s.quantity 
from sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN albums a ON s.album_id = a.album_id
where c.country = 'Ireland';

-- 9. Display the label name and number of albums for labels that have released more than two albums. Order by album count descending.
SELECT l.label_name, COUNT(a.album_id) AS album_count
FROM labels l
JOIN albums a ON l.label_id = a.label_id
GROUP BY l.label_id, l.label_name
HAVING COUNT(a.album_id) > 2
ORDER BY album_count DESC;

-- 10. Display each genre and its album count, but only genres with at least 3 albums.
SELECT genre, COUNT(*) AS album_count
FROM albums
GROUP BY genre
HAVING COUNT(*) >= 3;
-- > 3: 	More than 3
-- >= 3:	At least 3
-- < 3: 	Fewer than 3
-- <= 3: 	At most 3

-- 11. Display record label name and average album price for labels whose average album price is greater than €20.
SELECT l.label_name, AVG(a.price)
FROM labels l
JOIN albums a ON l.label_id = a.label_id
GROUP BY l.label_name
HAVING AVG(a.price) > 20;
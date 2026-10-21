-- Festival SQL Practice
-- Databases 1 - TU Dublin

-- 1. Display the artist name and country of every artist in the database.
select artist_name, country from artists;

-- 2. Display the artist name and genre of all artists from Ireland.
select artist_name, genre from artists
where country = 'Ireland';

-- 3. Display the concert ID, concert date and ticket price of all concerts with a ticket price greater than €40. Order the results by ticket price from highest to lowest.
select concert_id, concert_date, ticket_price from concerts
where ticket_price > 40
order by ticket_price DESC;

-- 4. Find the total number of concerts taking place at the festival.
SELECT COUNT(*)
FROM concerts;

-- 5. Find the total number of tickets sold and the average ticket price across all concerts. Give both calculated columns meaningful names.
select sum(tickets_sold) AS sold, avg(ticket_price) as mean from concerts;

-- 6. For each artist genre, display the genre and the number of artists belonging to it.
select genre, count(*) from artists
group by genre;

-- 7. Display each concert ID, artist name and concert date for all concerts. Order the results by concert date from earliest to latest.
select c.concert_id, c.concert_date, a.artist_name from concerts c
join artists a on a.artist_id = c.artist_id
order by concert_date ASC;

-- 8. Display the artist name, stage name and ticket price for concerts taking place on the Main Stage. Order by ticket price from highest to lowest.
SELECT a.artist_name, s.stage_name, c.ticket_price
FROM concerts c
JOIN artists a ON c.artist_id = a.artist_id
JOIN stages s ON c.stage_id = s.stage_id
WHERE s.stage_name = 'Main Stage'
ORDER BY c.ticket_price DESC;

-- 9. Display the stage name and number of concerts for stages hosting more than two concerts. Order the results by number of concerts from highest to lowest.
select s.stage_name, count(c.concert_id) from concerts c
join stages s on s.stage_id = c.stage_id
group by s.stage_name
having count(c.concert_id) > 2
order by count(c.concert_id) DESC;

-- 10. Find the number of concerts where the ticket price is less than €30.
SELECT COUNT(*) AS num_of_cons
FROM concerts
WHERE ticket_price < 30;

-- 11. Display the artist name, genre, and concert date for all concerts performed by artists from Ireland.
SELECT a.artist_name, a.genre, c.concert_date
FROM artists a
JOIN concerts c ON a.artist_id = c.artist_id
WHERE a.country = 'Ireland';
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS concerts;
DROP TABLE IF EXISTS stages;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
    artist_id INTEGER PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    genre VARCHAR(50) NOT NULL
);

CREATE TABLE stages (
    stage_id INTEGER PRIMARY KEY,
    stage_name VARCHAR(100) NOT NULL,
    capacity INTEGER NOT NULL
);

CREATE TABLE concerts (
    concert_id INTEGER PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists(artist_id),
    stage_id INTEGER NOT NULL REFERENCES stages(stage_id),
    concert_date DATE NOT NULL,
    ticket_price DECIMAL(8,2) NOT NULL,
    tickets_sold INTEGER NOT NULL
);

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY,
    concert_id INTEGER NOT NULL REFERENCES concerts(concert_id),
    customer_name VARCHAR(100) NOT NULL,
    purchase_date DATE NOT NULL
);

INSERT INTO artists VALUES
(1,'The Northern Lights','Ireland','Rock'),
(2,'Electric Pulse','Germany','Electronic'),
(3,'Golden Strings','Ireland','Folk'),
(4,'Midnight Echo','UK','Rock'),
(5,'Blue Horizon','USA','Jazz'),
(6,'Solar Beat','Germany','Electronic'),
(7,'Ocean Voices','Spain','Pop'),
(8,'Quiet River','Ireland','Folk');

INSERT INTO stages VALUES
(1,'Main Stage',5000),
(2,'River Stage',2000),
(3,'Garden Stage',800),
(4,'Sunset Stage',1500);

INSERT INTO concerts VALUES
(101,1,1,'2026-07-10',65.00,4200),
(102,2,2,'2026-07-10',40.00,1750),
(103,3,3,'2026-07-11',25.00,620),
(104,4,1,'2026-07-11',70.00,4800),
(105,5,4,'2026-07-12',35.00,900),
(106,6,2,'2026-07-12',45.00,1600),
(107,7,1,'2026-07-12',55.00,3900),
(108,1,4,'2026-07-13',30.00,1100),
(109,8,3,'2026-07-13',20.00,500),
(110,2,2,'2026-07-13',42.00,1850),
(111,3,4,'2026-07-14',28.00,1000),
(112,4,1,'2026-07-14',75.00,4500);

INSERT INTO tickets VALUES
(1,101,'Anna','2026-06-01'),
(2,101,'Brian','2026-06-02'),
(3,102,'Clara','2026-06-03'),
(4,103,'David','2026-06-04'),
(5,104,'Emma','2026-06-05'),
(6,104,'Finn','2026-06-06'),
(7,105,'Grace','2026-06-07'),
(8,106,'Hannah','2026-06-08'),
(9,107,'Ivan','2026-06-09'),
(10,108,'Julia','2026-06-10'),
(11,109,'Kevin','2026-06-11'),
(12,110,'Lena','2026-06-12'),
(13,110,'Marta','2026-06-13'),
(14,111,'Noah','2026-06-14'),
(15,112,'Olivia','2026-06-15');

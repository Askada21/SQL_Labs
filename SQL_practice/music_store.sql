-- MUSIC STORE SQL PRACTICE (PostgreSQL)
-- Fictional dataset for Databases 1 revision.
-- Run the entire script in DB-Fiddle's schema panel or in a PostgreSQL database.

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS labels;

CREATE TABLE labels (
    label_id INTEGER PRIMARY KEY,
    label_name VARCHAR(80) NOT NULL,
    city VARCHAR(60) NOT NULL
);

CREATE TABLE albums (
    album_id INTEGER PRIMARY KEY,
    album_title VARCHAR(100) NOT NULL,
    artist_name VARCHAR(80) NOT NULL,
    genre VARCHAR(40) NOT NULL,
    release_year INTEGER NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    label_id INTEGER NOT NULL REFERENCES labels(label_id)
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(80) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES albums(album_id),
    customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    sale_date DATE NOT NULL
);

INSERT INTO labels VALUES
(1,'Emerald Records','Dublin'),
(2,'North Sound','London'),
(3,'Blue River Music','Cork'),
(4,'Sunrise Audio','Berlin');

INSERT INTO albums VALUES
(101,'Midnight Lights','Nova','Pop',2022,18.50,1),
(102,'Coastal Drive','The Waves','Rock',2020,22.00,2),
(103,'Quiet Streets','Lena Hart','Jazz',2019,16.00,3),
(104,'Electric Sky','Nova','Pop',2024,25.00,1),
(105,'Northern Echoes','The Pines','Rock',2021,19.00,2),
(106,'Morning Coffee','Lena Hart','Jazz',2023,21.50,3),
(107,'Golden Hour','Mira','Pop',2025,27.00,4),
(108,'Deep Blue','Atlas','Electronic',2022,24.00,4),
(109,'After Rain','Mira','Pop',2021,15.00,1),
(110,'Old Roads','The Pines','Rock',2018,14.50,2),
(111,'Soft Focus','Atlas','Electronic',2024,23.00,4),
(112,'City Stories','Kira','Hip-Hop',2023,20.00,1);

INSERT INTO customers VALUES
(1,'Aoife Murphy','Ireland'),
(2,'James Smith','UK'),
(3,'Sara Novak','Germany'),
(4,'Daniel Byrne','Ireland'),
(5,'Emma Kelly','Ireland'),
(6,'Oliver Jones','UK');

INSERT INTO sales VALUES
(1,101,1,2,'2026-10-01'),
(2,102,2,1,'2026-10-02'),
(3,104,1,1,'2026-10-03'),
(4,103,3,3,'2026-10-03'),
(5,105,4,2,'2026-10-04'),
(6,107,5,1,'2026-10-05'),
(7,108,2,2,'2026-10-05'),
(8,101,4,1,'2026-10-06'),
(9,109,5,4,'2026-10-07'),
(10,110,6,1,'2026-10-08'),
(11,106,1,2,'2026-10-08'),
(12,104,3,1,'2026-10-09'),
(13,112,4,3,'2026-10-10'),
(14,102,5,2,'2026-10-11'),
(15,107,2,1,'2026-10-12'),
(16,111,6,2,'2026-10-13'),
(17,105,1,1,'2026-10-14'),
(18,108,3,1,'2026-10-15');

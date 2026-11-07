
-- CMPU2007: A Local Craft Market
-- PostgreSQL 18

-- ============================================
-- SETUP
-- ============================================

-- WARNING: Running this setup again resets
-- the craft market practice tables.

CREATE SCHEMA IF NOT EXISTS craft_practice;

SET search_path TO craft_practice;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shops;

CREATE TABLE shops (
    shop_id INT PRIMARY KEY,
    shop_name VARCHAR(80) NOT NULL
);

INSERT INTO shops (shop_id, shop_name)
VALUES
    (10, 'Willow'),
    (20, 'Clay Corner'),
    (30, 'Paper Trail');

SELECT * FROM shops ORDER BY shop_id;


-- ============================================
-- QUESTION 1: BUILD A PRODUCT TABLE
-- ============================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_code VARCHAR(120) NOT NULL UNIQUE,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    description TEXT,
    shop_id INT NOT NULL REFERENCES shops(shop_id)
        ON UPDATE CASCADE
);


-- ============================================
-- QUESTION 2: ADD THREE PRODUCTS
-- ============================================

INSERT INTO products (
    product_id,
    product_name,
    product_code,
    price,
    description,
    shop_id
)
VALUES
    (1, 'Willow', 'P101', 12.00, 'Woven basket', 10),
    (2, 'Mug', 'P102', 8.00, NULL, 20),
    (3, 'Notebook', 'P103', 5.00, 'Recycled paper', 30);

-- Negative price test.
-- Keep commented because CHECK rejects negative prices.

-- INSERT INTO products (
--     product_id, product_name, product_code, price, shop_id
-- )
-- VALUES (4, 'Test', 'P104', -5.00, 20);


-- ============================================
-- QUESTION 3: DISPLAY AND COMBINE TEXT
-- ============================================

-- a) Uppercase product name, lowercase product
-- code, and create a product label.

SELECT
    UPPER(product_name) AS uppercase_name,
    LOWER(product_code) AS lowercase_code,
    CONCAT(product_name, ' - EUR ', price) AS product_label
FROM products;

-- b) Combine shop names and product names.

SELECT shop_name AS name
FROM shops

UNION

SELECT product_name AS name
FROM products;


-- ============================================
-- QUESTION 4: CHANGE DATA AND ADD A COLUMN
-- ============================================

-- a) Increase all prices by 10%.
-- Run this UPDATE only once per setup.

UPDATE products
SET price = price * 1.10;

-- b) Add stock_quantity with DEFAULT 0.

ALTER TABLE products
ADD COLUMN stock_quantity INT DEFAULT 0;

-- Display updated prices and stock quantities.

SELECT
    product_name,
    price,
    stock_quantity
FROM products;


-- ============================================
-- QUESTION 5: CHANGE A SHOP KEY
-- ============================================

-- a) Change shop_id from 10 to 100.

UPDATE shops
SET shop_id = 100
WHERE shop_id = 10;

-- b) Display all products ordered by product_id.

SELECT *
FROM products
ORDER BY product_id;

-- c) Explanation:
-- Product 1's shop_id changed automatically
-- from 10 to 100 because the foreign key
-- uses ON UPDATE CASCADE.
-- This updates related records when the
-- referenced shop_id changes.


-- ============================================
-- ADDITIONAL QUERY
-- ============================================

-- Display products whose description is NULL.

SELECT *
FROM products
WHERE description IS NULL;


-- ============================================
-- FINAL RESULTS
-- ============================================

SELECT *
FROM shops
ORDER BY shop_id;

SELECT *
FROM products
ORDER BY product_id;

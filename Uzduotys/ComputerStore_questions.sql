-- 0 Select all products

SELECT * FROM ComputerStore.Products;
	
SELECT name FROM ComputerStore.Products;

SELECT name, prices FROM ComputerStore.Products;

SELECT name
FROM ComputerStore.Products
WHERE price <= 200;

SELECT *
FROM ComputerStore.Products
WHERE price BETWEEN 60 AND 120;

-- 5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT name, price * 100 AS price_in_cents
FROM ComputerStore.Products;

-- 6 Select all the products whose name begins with an "DVD"
SELECT *
FROM ComputerStore.Products
WHERE name LIKE 'DVD%';

-- 7 Select all the products whose name ends with an "e"
SELECT *
FROM ComputerStore.Products
WHERE name LIKE '%e';

-- 8 Select all the products whose names second letter is "o"
SELECT *
FROM ComputerStore.Products
WHERE name LIKE '_o%';

-- 9 Compute the average price of all the products.
SELECT AVG(price) AS average_price
FROM ComputerStore.Products;

-- 10 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(price)/ 100.0 AS average_price
FROM ComputerStore.Products
WHERE code = 2;

-- 11 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) AS product_count
FROM ComputerStore.Products
WHERE price >= 180;

-- 12 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name, price
FROM ComputerStore.Products
WHERE price >= 180
ORDER BY price DESC, name ASC;

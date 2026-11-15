USE sakila;

-- Task 1: List all film titles from the film table.
SELECT title
FROM film;

-- Task 2: Count the total number of films available in the database.
SELECT COUNT(*) AS total_films
FROM film;

-- Task 3: Retrieve a distinct list of languages used in films by joining the film and language tables.
SELECT DISTINCT l.name AS language
FROM film f
JOIN language l ON f.language_id = l.language_id;

-- Task 4: Select films with a rental rate greater than 4.0.
SELECT title, rental_rate
FROM film
WHERE rental_rate > 4.0;

-- Task 5: Display film titles along with their replacement cost and sort the results by replacement cost in descending order.
SELECT title, replacement_cost
FROM film
ORDER BY replacement_cost DESC;

-- Task 6: List all active customers from the customer table (active = 1).
SELECT *
FROM customer
WHERE active = 1;

-- Task 7: Show staff names along with their store addresses by joining the staff and address tables.
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- Task 8: Retrieve films released between the years 2005 and 2008.
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2008;

-- Task 9: Calculate the average rental duration for all films.
SELECT AVG(rental_duration) AS average_rental_duration
FROM film;

-- Task 10: Find the minimum and maximum rental rates among all films.
SELECT 
    MIN(rental_rate) AS min_rental_rate,
    MAX(rental_rate) AS max_rental_rate
FROM film;

-- Task 11: Count the number of films per rating. Group results by the film rating.
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

-- Task 12: For each film category, list the category name and the total number of films assigned to that category.
SELECT c.name AS category, COUNT(fc.film_id) AS total_films
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_films DESC;

-- Task 13: Display the total film length (SUM of length) for each film category.
SELECT c.name AS category, SUM(f.length) AS total_film_length
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
JOIN film f 
ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY total_film_length DESC;

-- Task 14: List the titles of films that belong to the 'Action' category.
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action'
ORDER BY f.title;

-- Task 15: Show film titles along with the average payment amount for rentals of that film.
SELECT f.title, AVG(p.amount) AS average_payment_amount
FROM film f
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY f.title
ORDER BY average_payment_amount DESC;

-- Task 16: List the top 5 most rented films, ordering results by the number of rentals.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Task 17: Retrieve all customers whose email addresses do not contain '@sakilacustomer.org'.
SELECT *
FROM customer
WHERE email NOT LIKE '%@sakilacustomer.org';

-- Task 18: Identify rental transactions that have not been returned yet (e.g., where return_date IS NULL).
SELECT *
FROM rental
WHERE return_date IS NULL;

-- Task 19: List staff members who have processed more than 50 rentals. 
SELECT s.staff_id, s.first_name, s.last_name, COUNT(r.rental_id) AS total_rentals
FROM staff s
JOIN rental r 
ON s.staff_id = r.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING COUNT(r.rental_id) > 50;

-- Task 20: Calculate the average total payment for each customer by joining the payment and customer tables.
SELECT c.customer_id, c.first_name, c.last_name, AVG(p.amount) AS vidutinis_mokejimas
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Task 21: Find customers whose total payment amounts fall between 100 and 500.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(p.amount) BETWEEN 100 AND 500;

-- Task 22: List film titles that have never been rented. Use a subquery to check films not present in the rental table.
SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
    SELECT i.film_id
    FROM inventory i
    JOIN rental r 
	ON i.inventory_id = r.inventory_id);
    
-- Task 23: Select the film titles of the top 10 cheapest films based on replacement cost.
SELECT title, replacement_cost
FROM film
ORDER BY replacement_cost ASC
LIMIT 10;

-- Task 24: List film titles with a length longer than the overall average film length (use a subquery to compute the average).
SELECT title
FROM film
WHERE length > (SELECT AVG(length)FROM film);
    
-- Task 25: Count the number of rentals for each film, grouping the results by film ID.
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title;

-- Task 26: Display each customer along with the total number of films they have rented, sorted by the rental count in descending order.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

-- Task 27: Identify the customer who has made the highest total payment.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_payment DESC
LIMIT 1;

-- Task 28: Create a union query that selects active customers in one query and inactive customers in another; include a label for status.
SELECT customer_id, first_name, last_name, 'Active' AS status
FROM customer
WHERE active = 1
UNION
SELECT customer_id, first_name, last_name, 'Inactive' AS status
FROM customer
WHERE active = 0;

-- Task 29: Insert a new customer record into the customer table with realistic dummy data.
INSERT INTO customer ( store_id, first_name,last_name, email, address_id, active, create_date )
VALUES ( 1,'Evelina', 'Petrauskaitė', 'evelina.petrauskaite@example.com', 5, 1, CURRENT_DATE );

-- Task 30: Delete a customer record based on a given customer_id if that customer is inactive.
DELETE FROM customer
WHERE customer_id = 601
AND active = 1;
  
-- Task 31: List films with an inventory count less than 5, by joining the film and inventory tables.
SELECT f.film_id, f.title, COUNT(i.inventory_id) AS inventory_count
FROM film f
JOIN inventory i 
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
HAVING COUNT(i.inventory_id) < 5;

-- Task 32: Identify the store that currently has the highest number of films available by analyzing the inventory.
SELECT s.store_id, COUNT(i.inventory_id) AS total_inventory
FROM store s
JOIN inventory i 
ON s.store_id = i.store_id
GROUP BY s.store_id
ORDER BY total_inventory DESC
LIMIT 1;

-- Task 33: Calculate the average film length for each language. Group by the language name.
SELECT l.name AS language, AVG(f.length) AS average_film_length
FROM film f
JOIN language l 
ON f.language_id = l.language_id
GROUP BY l.name;

-- Task 34: Count the number of films for each film rating (such as 'G', 'PG', etc.) and use the HAVING clause to filter ratings with at least 10 films.
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
HAVING COUNT(*) >= 10;

-- Task 35: For each country, count the number of customers by joining customer, address, city, and country tables.
SELECT co.country, COUNT(c.customer_id) AS number_of_customers
FROM customer c
JOIN address a 
ON c.address_id = a.address_id
JOIN city ci 
ON a.city_id = ci.city_id
JOIN country co 
ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY number_of_customers DESC;

-- Task 36: Find the names of actors who have starred in more than 10 films.
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 10;

-- Task 37: Display the top 3 customers by total payment amount, including their full name and total paid.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name,
SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_paid DESC
LIMIT 3;

-- Task 38: Find any duplicate film titles (if they exist) by grouping by title and having a count greater than 1.
SELECT title, COUNT(title) AS duplicate_count
FROM film
GROUP BY title
HAVING COUNT(title) >= 1;

-- Task 39: Select film titles where the replacement cost is higher than the average replacement cost for all films (using a subquery).
SELECT title, replacement_cost
FROM film
WHERE replacement_cost > ( SELECT AVG(replacement_cost) FROM film);

-- Task 40: Insert a new film record into the film table with example values for title, description, and rental_rate.
INSERT INTO film (
    title,
    description,
    release_year,
    language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating
)
VALUES (
    'Paslaptinga Sala',
    'Nuotykių filmas apie tyrinėtojų grupę, atradusią paslaptingą salą.',
    2024,
    1,
    5,
    4.99,
    120,
    19.99,
    'PG-13'
);
-- Task 41: Find the full name of the actor who has acted in the maximum number of movies. 
SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name, COUNT(fa.film_id) AS total_movies
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_movies DESC
LIMIT 1;

-- Task 42: Find out how many times a particular movie category is rented. Arrange these categories in the decreasing order of the number of times they are rented
SELECT c.name AS category, COUNT(r.rental_id) AS rental_count
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
JOIN inventory i 
ON fc.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY rental_count DESC;

-- Task 43: Write a query to find the full names of those customers who have rented at least 25 movies and belong to the city London.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN address a 
ON c.address_id = a.address_id
JOIN city ci 
ON a.city_id = ci.city_id
JOIN rental r 
ON c.customer_id = r.customer_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) >= 25;
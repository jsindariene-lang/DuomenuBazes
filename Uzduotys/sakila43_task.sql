USE sakila;

-- Task 1: List all film titles from the film table.

-- Task 2: Count the total number of films available in the database.

-- Task 3: Retrieve a distinct list of languages used in films by joining the film and language tables.

-- Task 4: Select films with a rental rate greater than 4.0.

-- Task 5: Display film titles along with their replacement cost and sort the results by replacement cost in descending order.

-- Task 6: List all active customers from the customer table (active = 1).

-- Task 7: Show staff names along with their store addresses by joining the staff and address tables.

-- Task 8: Retrieve films released between the years 2005 and 2008.

-- Task 9: Calculate the average rental duration for all films.

-- Task 10: Find the minimum and maximum rental rates among all films.

-- Task 11: Count the number of films per rating. Group results by the film rating.

-- Task 12: For each film category, list the category name and the total number of films assigned to that category.

-- Task 13: Display the total film length (SUM of length) for each film category.

-- Task 14: List the titles of films that belong to the 'Action' category.

-- Task 15: Show film titles along with the average payment amount for rentals of that film.

-- Task 16: List the top 5 most rented films, ordering results by the number of rentals.

-- Task 17: Retrieve all customers whose email addresses do not contain '@sakilacustomer.org'.

-- Task 18: Identify rental transactions that have not been returned yet (e.g., where return_date IS NULL).

-- Task 19: List staff members who have processed more than 50 rentals. 

-- Task 20: Calculate the average total payment for each customer by joining the payment and customer tables.

-- Task 21: Find customers whose total payment amounts fall between 100 and 500.

-- Task 22: List film titles that have never been rented. Use a subquery to check films not present in the rental table.

-- Task 23: Select the film titles of the top 10 cheapest films based on replacement cost.

-- Task 24: List film titles with a length longer than the overall average film length (use a subquery to compute the average).

-- Task 25: Count the number of rentals for each film, grouping the results by film ID.

-- Task 26: Display each customer along with the total number of films they have rented, sorted by the rental count in descending order.

-- Task 27: Identify the customer who has made the highest total payment.

-- Task 28: Create a union query that selects active customers in one query and inactive customers in another; include a label for status.

-- Task 29: Insert a new customer record into the customer table with realistic dummy data.

-- Task 30: Delete a customer record based on a given customer_id if that customer is inactive.

-- Task 31: List films with an inventory count less than 5, by joining the film and inventory tables.

-- Task 32: Identify the store that currently has the highest number of films available by analyzing the inventory.

-- Task 33: Calculate the average film length for each language. Group by the language name.

-- Task 34: Count the number of films for each film rating (such as 'G', 'PG', etc.) and use the HAVING clause to filter ratings with at least 10 films.

-- Task 35: For each country, count the number of customers by joining customer, address, city, and country tables.

-- Task 36: Find the names of actors who have starred in more than 10 films.

-- Task 37: Display the top 3 customers by total payment amount, including their full name and total paid.

-- Task 38: Find any duplicate film titles (if they exist) by grouping by title and having a count greater than 1.

-- Task 39: Select film titles where the replacement cost is higher than the average replacement cost for all films (using a subquery).

-- Task 40: Insert a new film record into the film table with example values for title, description, and rental_rate.

-- Task 41: Find the full name of the actor who has acted in the maximum number of movies. 

-- Task 42: Find out how many times a particular movie category is rented. Arrange these categories in the decreasing order of the number of times they are rented

-- Task 43: Write a query to find the full names of those customers who have rented at least 25 movies and belong to the city London.
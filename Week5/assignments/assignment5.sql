USE sakila;

-- 1a. Display the first and last names of all actors from the table actor.
SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
SELECT upper(concat_ws(", ", last_name, first_name)) AS 'Actor Name' FROM actor;

-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
SELECT actor_id AS 'Actor ID', first_name AS 'First Name', last_name AS 'Last Name' FROM actor
	WHERE first_name = 'Joe';

-- 2b. Find all actors whose last name contain the letters GEN:
SELECT * FROM actor
	WHERE last_name LIKE '%GEN%';

-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
SELECT * FROM actor 
	WHERE last_name LIKE '%LI%' 
	ORDER BY last_name, first_name;

-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
-- SELECT * FROM country;
SELECT country_id AS 'Country ID', country AS 'Country' FROM country
	WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the 
-- table actor named description and use the data type BLOB (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).
ALTER TABLE actor
	ADD description BLOB;

-- 3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.
ALTER TABLE actor
	DROP description;

-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name AS 'Last Name', count(*) AS 'Count' FROM actor
	GROUP BY last_name;

-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name AS 'Last Name', count(*) AS 'Count' FROM actor
	GROUP BY last_name
	HAVING count(*) >= 2;

-- 4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
UPDATE actor
	SET first_name = 'Harpo'
		WHERE first_name = 'Groucho' AND last_name = 'Williams';
        
-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO.
UPDATE actor
	SET first_name = 'Groucho'
		WHERE first_name = 'Harpo' AND last_name = 'Williams';

-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
DESCRIBE address;

-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
SELECT t1.first_name AS 'First Name', t1.last_name AS 'Last Name' FROM staff t1
	INNER JOIN address t2
		ON t1.address_id = t2.address_id;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
SELECT t1.staff_id AS 'Staff ID', 
	concat_ws(', ', t1.last_name, t1.first_name) AS 'Staff Name', sum(t2.amount) AS 'Total amount'
		FROM staff t1
	INNER JOIN payment t2
		ON t1.staff_id = t2.staff_id
	GROUP BY t2.staff_id;

-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
SELECT t1.*, count(*) AS 'Number of actors' FROM film t1
	INNER JOIN film_actor t2
		ON t1.film_id = t2.film_id
	GROUP BY t2.film_id;


-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT count(*) AS 'No. of copies' FROM inventory
	WHERE film_id = (
		SELECT film_id FROM film WHERE
			title = 'Hunchback Impossible'
    );
    
SELECT t2.title AS 'Film title', count(*) FROM inventory t1
	INNER JOIN film t2
		ON t1.film_id = t2.film_id
	WHERE t2.title = 'Hunchback Impossible'
    GROUP BY t1.film_id;


-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
SELECT t1.customer_id AS 'Customer ID', concat_ws(', ', t1.last_name, t1.first_name) AS 'Customer Name', 
	sum(t2.amount) AS 'Total amount' FROM customer t1
	INNER JOIN payment t2
		ON t1.customer_id = t2.customer_id
	GROUP BY t2.customer_id
    ORDER BY t1.last_name;

-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, 
-- films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles 
-- of movies starting with the letters K and Q whose language is English.

SELECT title AS 'Movie' FROM film
	WHERE title LIKE 'K%' OR 'Q%'
		AND film_id IN (
			SELECT film_id FROM film 
				WHERE language_id IN (
					SELECT language_id FROM language
						WHERE name = 'English'
                )
        );


-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT concat(last_name, ' ', first_name) AS 'Actors' FROM actor
	WHERE actor_id IN (
		SELECT actor_id FROM film_actor
			WHERE film_id IN (
				SELECT film_id FROM film
					WHERE title = 'Alone Trip'
            )
    );

	

-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
SELECT concat_ws(', ', t1.last_name, t1.first_name) AS 'Customer', 
	t1.email AS Email FROM customer t1
    INNER JOIN address t2
		ON t1.address_id = t2.address_id
		INNER JOIN city t3
			ON t2.city_id = t3.city_id
            INNER JOIN country t4
				ON t3.country_id = t4.country_id
	WHERE t4.country = 'Canada';

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT t1.title AS Title FROM film t1
	INNER JOIN film_category t2
		ON t1.film_id = t2.film_id
        INNER JOIN category t3
			ON t2.category_id = t3.category_id
			WHERE t3.name = 'Family';


-- 7e. Display the most frequently rented movies in descending order.
SELECT t1.film_id, t1.title AS Movie, count(*) AS Count FROM film t1
	INNER JOIN inventory t2
		ON t1.film_id = t2.film_id
	GROUP BY t2.film_id
	ORDER BY 3 DESC;

-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT t1.*, concat('$', sum(t4.amount)) AS Business FROM store t1
	INNER JOIN inventory t2
		ON t1.store_id = t2.store_id
        INNER JOIN rental t3
			ON t2.inventory_id = t3.inventory_id
            INNER JOIN payment t4 
				ON t3.rental_id = t4.rental_id
	GROUP BY t1.store_id;

-- 7g. Write a query to display for each store its store ID, city, and country.
SELECT t1.store_id, t3.city, t4.country FROM store t1
	INNER JOIN address t2
		ON t1.address_id = t2.address_id
			INNER JOIN city t3
				ON t2.city_id = t3.city_id
					INNER JOIN country t4
						ON t3.country_id = t4.country_id;

-- 7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
SELECT category.name, sum(payment.amount) FROM category
	INNER JOIN film_category
		ON category.category_id = film_category.category_id			
			INNER JOIN inventory
				ON film_category.film_id = inventory.film_id
					INNER JOIN rental
						ON inventory.inventory_id = rental.inventory_id
							INNER JOIN payment
								ON rental.rental_id = payment.rental_id
			GROUP BY category.category_id
            ORDER BY 2 DESC
            LIMIT 5;

-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution 
-- from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
CREATE VIEW `TOP FIVE GENRES (gross revenue)` AS 
	SELECT category.name, sum(payment.amount) FROM category
	INNER JOIN film_category
		ON category.category_id = film_category.category_id
			INNER JOIN inventory
				ON film_category.film_id = inventory.film_id
					INNER JOIN rental
						ON inventory.inventory_id = rental.inventory_id
							INNER JOIN payment
								ON rental.rental_id = payment.rental_id
			GROUP BY category.category_id
            ORDER BY 2 DESC
            LIMIT 5;

-- 8b. How would you display the view that you created in 8a?
SELECT * FROM `TOP FIVE GENRES (gross revenue)`;

-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
DROP VIEW `TOP FIVE GENRES (gross revenue)`;

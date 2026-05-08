-- 1.  List the last names of actors (alphabetically), as well as how many actors have that last name.

SELECT last_name, count(last_name) AS number_of_actors
FROM actor
GROUP BY last_name
ORDER BY last_name ASC;


-- 2.  List last names of actors and the number of actors who have that last name, but only for names 
-- that are shared by at least three actors, sort so that last name with the highest number of actors appears at the top.

SELECT last_name, COUNT(last_name) AS number_of_actors
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >= 3
ORDER BY number_of_actors DESC;


-- 3.  List all comedy films (regardless of other genres) by displaying the title and film year and 
-- sort by revenue_mils so that the highest appears first.

SELECT title, film_year
FROM movies
WHERE genre = 'Comedy'
ORDER BY revenue_mils DESC;


-- 4.  Display how many films there are in the database for each year. Output should only contain the
-- year and number of films with oldest films appearing first.

SELECT film_year, count(film_year) AS count_of_films
FROM movies
GROUP film_year
ORDER BY film_year ASC;


-- 5.  Show all directors who have directed more than 4 films. The output should contain their names and
-- number of films they have directed. The output should show directors with more films at the top, and if
-- there is a tie, sort alphabetically.

SELECT director, COUNT(director) AS count_of_films
FROM movies
GROUP BY director
HAVING COUNT(director) >4
ORDER BY COUNT(director) DESC, director ASC;


-- 6.  Display the highest revenue amount for each year – output should show the film_year and revenue_mils
-- and it should show oldest films first.

SELECT film_year, MAX(revenue_mils)
FROM movies
GROUP BY film_year
ORDER BY film_year ASC;


-- 7.  List highest postal codes for all districts staring with either A, B, C, or D ordered by the starting letter.

SELECT district, MAX(postal_code) 
FROM address
WHERE district LIKE 'A%' or district LIKE 'B%' or district LIKE 'C%' or district LIKE 'D%'
GROUP BY district
ORDER BY district ASC;


-- 8.  Show the ID and average money spent, rounded to 3 decimal points, from 15 top spending customers 
-- (by average spent) that spent below 4.5 so that customers who spent more appear at the top.

SELECT customer_id, ROUND(AVG(amount),3) AS average_money_spent
FROM payment
GROUP BY customer_id
HAVING AVG(amount) < 4.5
ORDER BY AVG(amount)  DESC
LIMIT 15;


-- 9.  Show the total number of actors who share their last name with 3 or more other actors.

SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name 
HAVING COUNT(last_name) >= 4;


-- 10. Show the total revenue by month. Hint: Research “EXTRACT”.

SELECT SUM(amount) AS total_revenue, EXTRACT(MONTH FROM payment_date) AS pay_month 
FROM payment
GROUP BY EXTRACT(MONTH FROM payment_date)
ORDER BY EXTRACT(MONTH FROM payment_date);


# Project3_Data_Analysis_With_SQL
## Film Industry Sales Analysis 
### Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)

### Project Overview

This data analysis project aims to make extraction of data that are patterned in line with structured questions directed to a film-movie rental company database. By using Structured Query Language (SQL) to analyzing various aspects of the data to extract information 

### Data Sources

Primary dataset used for this analysis which are provided in the files attached to this project are:
-	da_course_db
-	dvdrental.tar

### Tools
	
- DBeaver : for connecting postgre sql database (da_course_bd) and querying  the database
- PgAdmin 4: for creating database (dvdrental.tar) and querying the database

### Data Cleaning/Preparation

In the initial data preparation phase, we performed the following tasks:
1. Database connection of “da_course_db” using DBeaver,
2. Database creation of “dvdrental.tar” using PgAdmin 4,
	
### Exploratory Data Analysis (EDA)

EDA involves exploring the data to answer key QUESTIONS, such as:

Question 1:  List the last names of actors (alphabetically), as well as how many actors have that last name.

Question 2:  List last names of actors and the number of actors who have that last name, but only for names  that are shared by at least three actors, sort so that last name with the highest number of actors appears at the top. 

Question 3:  List all comedy films (regardless of other genres) by displaying the title and film year and 
sort by revenue_mils so that the highest appears first.

Question 4:  Display how many films there are in the database for each year. Output should only contain the year and number of films with oldest films appearing first.

Question 5:  Show all directors who have directed more than 4 films. The output should contain their names and number of films they have directed. The output should show directors with more films at the top, and if there is a tie, sort alphabetically.

Question 6:  Display the highest revenue amount for each year – output should show the film_year and revenue_mils and it should show oldest films first.

Question 7:  List highest postal codes for all districts staring with either A, B, C, or D ordered by the starting letter.

Question 8:  Show the ID and average money spent, rounded to 3 decimal points, from 15 top spending customers (by average spent) that spent below 4.5 so that customers who spent more appear at the top.

Question 9:  Show the total number of actors who share their last name with 3 or more other actors.

Question 10: Show the total revenue by month. Hint: Research “EXTRACT”.

### Data Analysis

Question 1:

SELECT last_name, count(last_name) AS number_of_actors

FROM actor

GROUP BY last_name

BY last_name ASC;


Question 2:

SELECT last_name, COUNT(last_name) AS number_of_actors

FROM actor

GROUP BY last_name

HAVING COUNT(last_name) >= 3

ORDER BY number_of_actors DESC;


Question 3:

SELECT title, film_year

FROM movies

WHERE genre = 'Comedy'

ORDER BY revenue_mils DESC;


Question 4:

SELECT film_year, count(film_year) AS count_of_films

FROM movies

GROUP film_year

ORDER BY film_year ASC;


Question 5:

SELECT director, COUNT(director) AS count_of_films

FROM movies

GROUP BY director

HAVING COUNT(director) >4

ORDER BY COUNT(director) DESC, director ASC;


Question 6:

SELECT film_year, MAX(revenue_mils)

FROM movies

GROUP BY film_year

ORDER BY film_year ASC;


Question 7:

SELECT district, MAX(postal_code) 

FROM address

WHERE district LIKE 'A%' or district LIKE 'B%' or district LIKE 'C%' or district LIKE 'D%'

GROUP BY district

ORDER BY district ASC;


Question 8:

SELECT customer_id, ROUND(AVG(amount),3) AS average_money_spent

FROM payment

GROUP BY customer_id

HAVING AVG(amount) < 4.5

ORDER BY AVG(amount)  DESC

LIMIT 15;


Question 9:

SELECT last_name, COUNT(last_name)

FROM actor

GROUP BY last_name 

HAVING COUNT(last_name) >= 4;


Question 10:

SELECT SUM(amount) AS total_revenue, EXTRACT(MONTH FROM payment_date) AS pay_month 

FROM payment

GROUP BY EXTRACT(MONTH FROM payment_date)

ORDER BY EXTRACT(MONTH FROM payment_date);

### Result/Findings

Findings are attached as a file for each question in EDA and Data analysis code section as follows:
Question 1, Question 2, Question 3, Question 4, Question 5, Question 6, Question 7, Question 8, Question 9, Question 10

### Limitations

- We cannot remove missing values (NULL values) from the data because we are only allowed to query the database not that we can perform any adjustment to the structure of the data to suit our needs.

### References
	
- [stack Overflow](https://stack.com)
- Statistics for Data Analysis by Using Python:	Dr. Sandeep Kumar (Quality Guru Inc.) - UDEMY
- Complete SQL Bootcamp - Go from Zero to Hero:     Dr. Jose Portilla (Pierian Training) - UDEMY
- Complete Microsoft Power BI:  By Nikolai Schuler, (Ligency, SuperDataScience Team) - UDEMY
- Microsoft Excel – Excel from Beginner to Advanced:	By Kyle Pew - UDEMY
- Tableau A-Z - Hands-on Tableau:	By Kirill Eremenko, (SuperData ScienceTeam, Ligency)
- Python for Time Series Data Analysis:		By Dr. Jose Portilla (Pierian Training) - UDEMY
- Complete KoboToolbox (ODK), google form Training:	By Alexander Mtembenuzeni - UDEMY
- Map Academy: Get mapping quickly, with QGIS:	By Professor Alasdair Rae - UDEMY
- Map Academy: Taking QGIS to the next level: 		By Professor Alasdair Rae - UDEMY
- The Supervised Machine Learning Bootcamp:		By 365 Careers - UDEMY

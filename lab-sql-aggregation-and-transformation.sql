use sakila;

/*CHALLENGE 1*/
/*You need to use SQL built-in functions to gain insights relating to the duration of movies:

1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
1.2. Express the average movie duration in hours and minutes. Don't use decimals.
Hint: Look for floor and round functions.*/

select * from film;
select min(LENGTH) as min_duration from film;
select max(LENGTH) as max_duration from film;

select CONCAT(FLOOR(avg(LENGTH) / 60), 'hours', round(avg(LENGTH)%60, 0), 'minutes') as avg_duration
from film;

/*You need to gain insights related to rental dates:

2.1 Calculate the number of days that the company has been operating.
Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column 
from the latest date.
2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. 
Return 20 rows of results.
2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday',
depending on the day of the week.
Hint: use a conditional expression.*/

select min(rental_date) as start_date, max(rental_date) as end_date from rental;
select DATEDIFF(max(rental_date), min(rental_date)) as operation_days from rental;

/*ALTER TABLE rental
ADD rental_month varchar(10),
ADD	rental_weekday varchar(10);*/

select DATE_FORMAT(rental_date, '%M') AS rental_month from rental;
select WEEKDAY(rental_date) AS rental_weekday from rental;
limit 20;



/*3. You need to ensure that customers can easily access information about the movie collection.
 To achieve this, retrieve the film titles and their rental duration.
 If any rental duration value is NULL, replace it with the string 'Not Available'. 
 Sort the results of the film title in ascending order.

Please note that even if there are currently no null values in the rental duration column,
the query should still be written to handle such cases in the future.
Hint: Look for the IFNULL() function.*/


SELECT title, IFNULL(rental_duration, 'Not Available') as duration
from film
order by title ASC;


/*CHALLENGE 2*/

/*1. Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
1.1 The total number of films that have been released.
1.2 The number of films for each rating.
1.3 The number of films for each rating, sorting the results in descending order of the number of films.
This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.*/

select * from film;

select rating, count(*) as rating
from film
group by rating
order by rating(desc);



/*2. Using the film table, determine:
2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration.
Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer
longer movies.*/

select rating, avg(length)
from film
group by rating
order by avg(length) DESC;

select rating, avg(length) as average_duration
from film
group by rating
having average_duration > 180
order by average_duration DESC;

/*Bonus: determine which last names are not repeated in the table actor.*/

select DISTINCT last_name from actor;



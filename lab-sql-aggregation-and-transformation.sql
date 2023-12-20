use sakila;

/*Display all available tables in the Sakila database*/

show tables;

/*Retrieve all the data from the tables actor, film and customer.*/

select * from actor;
select * from film;
select * from customer;

/*Retrieve the following columns from their respective tables:
3.1 Titles of all films from the film table
3.2 List of languages used in films, with the column aliased as language from the language table
3.3 List of first names of all employees from the staff table*/

select * from `language`;
select name as language from language;
select * from staff;
select first_name from staff;


/*Retrieve unique release years.*/

select * from film;
select distinct release_year from film;

/*Counting records for database insights:
5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.*/

select * from store;
select count(*) as store_number from store;

select count(*) as employeenumber from staff;

select count(film_id) as available_films from inventory;
select count(inventory_id) as rented_films from rental;

select count(distinct last_name) as number_of_distinct_last_names from actor;


/*Retrieve the 10 longest films.*/

select title
from film
order by length desc
limit 10;

/*Use filtering techniques in order to:
7.1 Retrieve all actors with the first name "SCARLETT".*/

select * 
from actor_info
where first_name = "SCARLETT";


/*BONUS:
7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

Hint: use LIKE operator. More information here.
Determine the number of films that include Behind the Scenes content*/
select * from film;
select title
from film 
where title like "ARMAGEDDON" 
AND length > 100;

select count(film_id) as BTS_films 
from film 
where special_features = ('Behind the Scenes');


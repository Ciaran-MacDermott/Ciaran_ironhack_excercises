USE sakila;
/*Explore tables */

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.address;
SELECT * FROM film_category
SELECT * FROM payment
Select * from store;
Select * from sakila.staff;
/*Select one column from a table. Get film titles.*/

SELECT title FROM sakila.film;
select * from sakila.film;
select first_name,last_name from sakila.customer;

/*Select one column from a table and alias it.*/

SELECT release_year AS year FROM film;
Select language_id as language from film;

select first_name,last_name from sakila.staff;
SELECT DISTINCT first_name,last_name FROM sakila.staff;
SELECT COUNT(DISTINCT first_name,last_name) FROM staff;

/*CHECKING amount of stores*/
SELECT COUNT(DISTINCT store_id) FROM store;

SELECT * FROM customer WHERE first_name = 'BARBARA';

/*CHECKING FIRST NAMES FOR STAFF*/
select first_name from sakila.staff;


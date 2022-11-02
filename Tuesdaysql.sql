/*Which actor has appeared in the most films?
Hint: group by actor_id
Expected output:GINA DEGENERES	42*/


SELECT first_name, last_name, COUNT(film_id) 
FROM film_actor as a
LEFT JOIN actor as b on
a.actor_id = b.actor_id
GROUP BY actor_id
ORDER by COUNT(film_id) desc
limit 1;

select first_name, last_name, count(film_id)
from film_actor as a
left join actor as b using(actor_id)
group by actor_id
order by count(film_id) desc
limit 1;

/* 2 Most active customer (the customer that has rented the most number of films)*/

select first_name, last_name, count(rental_id)
from rental as a
left join customer as b using(customer_id)
group by customer_id
order by count(rental_id) desc
limit 1;

/*3. List number of films per category.*/

select name,count(film_id)
from film_category as a
left join category as b using(category_id)
group by category_id
order by count(film_id) desc;

/*4. Display the first and last names, as well as the address, of each staff member.
Mike	Hillyer		23 Workhaven Lane*/

select * from address;

select first_name,last_name,address
from address as a
inner join staff as b using(address_id);

/*5. get films titles where the film language is either English or italian, 
and whose titles starts with letter "M" , sorted by title descending.
title,name
"MYSTIC TRUMAN",English
"MUSSOLINI SPOILERS",English*/

select `title`,`name`
from film as a
inner join language as b using(language_id)
WHERE LEFT(`title`, 1) = 'M'
having `name` LIKE "English" or `name` LIKE "Italian"
ORDER BY `title` desc;

/*6. Display the total amount rung up by each staff member in August of 2005.
Expected output:
Jon Stephens	12218.48
Mike Hillyer	11853.65*/

select * from payment;

select first_name,last_name, sum(amount)
from payment as a
join staff as b using(staff_id)
where payment_date between "2005-08-01 00:00:00" and "2005-08-31 00:00:00"
group by staff_id
order by sum(amount) desc;

/*7 List each film and the number of actors who are listed for that film.
Expected output: Top 10 out of 997 rows
LAMBS CINCINATTI		15*/

select `title`,count(actor_id)
from film_actor as a
left join film as b using(film_id)
group by film_id
order by count(actor_id)desc;

/*8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
Expected output: Top 10 out of 599 rows
RAFAEL	ABNEY	97.79*/

select first_name,last_name, sum(amount)
from payment as a
join customer as b using(customer_id)
group by customer_id
order by last_name;

/* 9 Write sql statement to check if you can find any actor who never particiapted in any film.
Expect output: no actor found.*/

select first_name,last_name,count(film_id)
from film_actor as a
join actor as b using(actor_id)
group by actor_id
having count(film_id) = 0;

/* get the addresses that has NO customers, and ends with the letter "e"
address
"47 MySakila Drive"
"23 Workhaven Lane"
"1411 Lillydale Drive"*/

select address, count(customer_id)
from address as a
join customer as b using(address_id)
group by(address_id)
having count(customer_id) = 0;




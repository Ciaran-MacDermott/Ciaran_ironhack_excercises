#1 List all films whose length is longer than the average of all the films.#
use sakila;

select title from sakila.film
	where length > (select avg(length)
	from film)
	order by title
	;
    
#2 How many copies of the film Hunchback Impossible exist in the inventory system?#

select count(inventory_id) as count 
from inventory 
where film_id = 
(select film_id from film
where title = 'Hunchback Impossible' )
group by film_id;

#3 Use subqueries to display all actors who appear in the film Alone Trip.#

select first_name,last_name from actor as a
where actor_id in 
(select actor_id from film_actor where film_id =
		(select film_id from film where title = 'Alone Trip')
        );
        
select * from category;
    
/*4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
Identify all movies categorized as family films.*/
            
select title from film as f
where film_id in 
(select film_id from film_category where category_id =
		(select category_id from category where name = 'family')
        );
        
select * from country;
        
/*5 Get name and email from customers from Canada using subqueries. 
Do the same with joins. Note that to create a join, 
you will have to identify the correct tables with their primary keys and foreign keys,
 that will help you get the relevant information. */
 
select first_name, last_name, email from customer as canada_customer
where address_id in (
(select address_id from address where city_id in
	(select city_id from city where country_id in
        (select country_id from country where country = "Canada")
        )));
        
select first_name,last_name, email
from customer as canada_customer
join address as a using(address_id)
join city as c using (city_id)
WHERE country_id IN( SELECT country_id from country where country = "Canada");
    
select first_name,last_name, email
from customer as canada_customer
join address as a using(address_id)
join city as c using (city_id)
join country as cou using (country_id)
WHERE country="Canada";
       
  /*6Which are films starred by the most prolific actor?
  First you will have to find the most prolific actor
  then use that actor_id to find the different films that he/she starred.*/
 

select title from film as t
where film_id in (
 (select film_id from film_actor where actor_id = 
	(select actor_id from film_actor     
		group by actor_id
		order by count(film_id) desc
		limit 1 ))        
        );
        

        
        




    
    



	
            
  
    
    

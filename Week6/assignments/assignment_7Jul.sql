-- 1. For each rating type, list the number of total films available for rental.

select rating, count(film_id) from film
group by rating

-- 2. For each rating type, list the number of total DVD copies and max/min/average rental cost.
-- Note that there may be multiple DVD copies for one film in the rental system.
select t1.rating, count(t2.inventory_id) as "DVD copies",
max(t1.rental_rate) as max,  min(t1.rental_rate) as min,  avg(t1.rental_rate) as avg from film t1
inner join inventory t2
on t1.film_id = t2.film_id
group by rating


-- 3. Retrieve the names of actors/actresses who have never appeared in any 'R' rated movies. Use COUNT
select distinct concat_ws(" ",t1.first_name,t1.last_name) as Name from actor t1
join film_actor t2
on t1.actor_id = t2.actor_id
where t2.film_id in (select film_id from film where rating != "R" )

-- 4. Retrieve the names of actors/actresses who have never appeared in any 'R' rated movies.
select distinct concat_ws(" ",t1.first_name,t1.last_name) as Name from actor t1
join film_actor t2
on t1.actor_id = t2.actor_id
where t2.film_id in (select film_id from film where rating != "R" )

-- 5. Retrieve the names of actors/actresses who have never appeared in any 'R' rated movies. 
select distinct concat_ws(" ",t1.first_name,t1.last_name) as Name from actor t1
join film_actor t2
on t1.actor_id = t2.actor_id
where t2.film_id in (select film_id from film where rating != "R" )

-- 6. Retrieve the title of film with the most DVD copies without using LIMIT/ORDER BY. List title and the # of DVD copies
select t1.title, count(t1.title) as cnt from film t1
join inventory t2
on t1.film_id = t2.film_id
group by t1.title
order by cnt desc
limit 1

-- 7. List the film title with the smallest number of characters (actors/actresses). 
select t1.title, count(t2.actor_id) as cnt from film t1 
join film_actor t2
on t1.film_id = t2.film_id
group by t1.title
having cnt = min(cnt)

-- 8. Retrieve the film titles that are currently completely rented out. 
-- Assume return_date field is NULL if rented out but not returned yet.

select distinct t1.title from film t1
join inventory t2
on t1.film_id = t2.film_id
join rental t3
on t2.inventory_id = t3.inventory_id
where return_date is null









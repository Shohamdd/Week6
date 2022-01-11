//Ex1
1.
select name distinct from language
2.
Select title, description,name from film
join language on language.language_id=film.language_id


Select title, description, name from film
full join language on language.language_id=film.language_id

Select title, description, name from film
left join language on language.language_id=film.language_id


Select title, description, name from film
right join language on language.language_id=film.language_id

3.
CREATE TABLE new_films (
	id serial primary KEY,
	name varchar(25) not null
);

INSERT INTO new_films (name) VALUES ('Spider man'),('Fight Club'),('Avengers'), ('Harry Potter')

4.
CREATE TABLE films_review (
	review_id serial primary key,
	score smallint not null,
	title varchar(50) not null,
	review_text text,
	last_update date not null default CURRENT_DATE,
	film_id integer REFERENCES new_films(id) ON DELETE CASCADE,
	language_id integer REFERENCES language(language_id)
);

5.
Insert into films_review (score,title,review_text,film_id,language_id)
			Values (10,'really good movie','you must watch it!!!',(select id from new_films where name ilike 'spider%'),(select language_id from language where name ilike 'eng%') ),
					(10,'such a good movier','alot of good scences loved it!',(select id from new_films where name ilike 'fight%'),(select language_id from language where name ilike 'eng%') );

Delete a film that has a review from the new_film table, what happens to the customer_review table?

Delete from new_films where name ilike 'figh%'

select * from films_review

//Ex2
1.
select * from language

update films_review
set language_id = (select language_id from language where name ilike 'ger')
where film_id =1


2.
adrees id or cannot get into the customer


3.
very easy

4.
select count(rental_id) from rental where return_date is null /Answer=183

5.
select title,replacement_cost from film
join inventory on film.film_id=inventory.film_id
join rental on rental.inventory_id=inventory.inventory_id
where return_date is null
order by replacement_cost DESC limit 30

6.
6.1
select distinct title,description ,actor.first_name,actor.last_name from film
join film_actor on film.film_id = film.film_id
join actor on actor.actor_id=film_actor.actor_id
where actor.first_name ='Penelope' and actor.last_name='Monroe' and description ilike '%sumo wrestler%'


6.2
SELECT distinct title, description , length, rating from film
join film_category on film.film_id=film_category.film_id
join category on category.category_id=film_category.category_id
where category.name='Documentary' and length<60 and rating='R'


6.3
SELECT distinct title,amount from film
join inventory on inventory.film_id=film.film_id
join rental on inventory.inventory_id= rental.inventory_id
join customer on rental.customer_id = customer.customer_id
join payment on payment.customer_id = customer.customer_id
where customer.first_name='Matthew' and customer.last_name='Mahan' and amount > 4 and return_date between '2005-07-28' and '2005-08-01'



6.4
SELECT distinct title,description,replacement_cost from film
join inventory on inventory.film_id=film.film_id
join rental on inventory.inventory_id= rental.inventory_id
join customer on rental.customer_id = customer.customer_id
where customer.first_name='Matthew' and customer.last_name='Mahan' and
(title ilike '%boat%' or description ilike '%boat')
order BY replacement_cost desc

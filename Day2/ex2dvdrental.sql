select * from customer

SELECT (first_name, last_name) as full_name from customer

Select DISTINCT create_date from customer

SELECT * FROM customer ORDER BY first_name DESC

SELECT film_id, title, description,release_year, rental_rate from film ORDER BY rental_rate

SELECT address,phone from address where district ='Texas'

SELECT * FROM film where film_id in (15,150)

SELECT film_id, title, description, length,rental_rate from film where title='The Matrix'

SELECT film_id, title, description, length,rental_rate from film where title ilike 'tm%'

Select title,replacement_cost from film ORDER BY replacement_cost limit 10

SELECT title,replacement_cost FROM film ORDER BY replacement_cost offset 10 FETCH FIRST 10 ROWS ONLY

SELECT first_name, customer.customer_id, amount, payment_date FROM customer
inner JOIN payment
on customer.customer_id=payment.customer_id


SELECT film.title , film.film_id , inventory.inventory_id from film
full join inventory on film.film_id= inventory.film_id
full join rental on inventory.inventory_id=rental.inventory_id
where return_date is null


SELECT country, city distinct from city
join country
on city.country_id=country.country_id
order by country

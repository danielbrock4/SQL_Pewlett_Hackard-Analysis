select first_name, max(last_update)
from actor
--WHERE first_name = 'GOLDIE'
Group By first_name
HAVING Max(last_update) < '2017-02-16'
Limit 5
;
select * from film
;
select rating,
	ROUND(Avg(length),2) as avg_movie_length,
	MIN(length) as shortest_movie,
	Max(length) as longest_title
FROM film
GROUP BY rating
ORDER BY avg_movie_length;

SELECT COUNT(first_name) as count, 
	first_name
FROM ACTOR
GROUP BY first_name
ORDER BY count desc;

SELECT length,
	round(avg(replacement_cost),2) as replacement
FROM film
GROUP BY length
order by length
limit 10;

SELECT 

FROM country;

select * from city;

SELECT country.country, 
	COUNT(city) AS "country count"
FROM city
JOIN country USING(country_id)
GROUP BY country.country
ORDER BY "country count" DESC;

SELECT DISTINCT customer_id, rental_date, store_id, title
FROM rental
	JOIN inventory USING (inventory_id)
	JOIN film USING (film_id)
WHERE customer_id = 130
Order by rental_date;

SELECT DISTINCT ON (cu.customer_id) r.rental_date, cu.first_name, cu.last_name, cu.email
FROM rental as r
	JOIN customer cu USING (customer_id)
ORDER BY cu.customer_id, r.rental_date desc
LIMIT 5;
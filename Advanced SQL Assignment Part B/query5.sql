-- Find the film_title of all films which feature both RALPH CRUZ and WILL WILSON
-- Order the results by film_title in ascending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

SELECT 
  film.title film_title
FROM 
  film 
  INNER JOIN film_actor film_actor1 ON film_actor1.film_id = film.film_id 
  INNER JOIN actor actor_1 ON film_actor1.actor_id = actor_1.actor_id 
  INNER JOIN film_actor film_actor2 ON film_actor2.film_id = film.film_id 
  INNER JOIN actor actor_2 ON film_actor2.actor_id = actor_2.actor_id 
WHERE 
  (
    actor_1.first_name = 'RALPH' 
    AND actor_1.last_name = 'CRUZ'
  ) 
  AND (
    actor_2.first_name = 'WILL' 
    AND actor_2.last_name = 'WILSON'
  ) 
ORDER BY 
  film.title;

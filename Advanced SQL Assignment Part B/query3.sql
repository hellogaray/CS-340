-- Find the first_name, last_name and total_combined_film_length of Animation films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Animation films) and the total length of Animation films they have been in.
-- Look at the category table to figure out how to filter data for Animation films.
-- Order your results by the actor_id in ascending order.
-- Put query for Q3 here

SELECT 
  actor.actor_id, 
  actor.first_name, 
  actor.last_name, 
  COALESCE(
    count_table.total_combined_film_length, 
    0
  ) total_combined_film_length 
FROM 
  actor 
  LEFT JOIN(
    SELECT 
      actor.actor_id, 
      first_name, 
      last_name, 
      SUM(LENGTH) AS total_combined_film_length 
    FROM 
      actor 
      INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
      INNER JOIN film_category ON film_actor.film_id = film_category.film_id 
      INNER JOIN film ON film_actor.film_id = film.film_id 
      INNER JOIN category ON (
        category.category_id = film_category.category_id
      ) 
      AND(category.name = 'Animation') 
    GROUP BY 
      actor.actor_id 
    ORDER BY 
      total_combined_film_length ASC
  ) AS count_table ON actor.actor_id = count_table.actor_id 
ORDER BY 
  actor.actor_id ASC;

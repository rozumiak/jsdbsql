SELECT
    p.id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM
    person p
INNER JOIN
    character_actors ca ON p.id = ca.person_id
INNER JOIN
    character_ c ON ca.character_id = c.id
INNER JOIN
    movie m ON c.movie_id = m.id
GROUP BY
    p.id,
    p.first_name,
    p.last_name
ORDER BY
    total_movies_budget DESC;

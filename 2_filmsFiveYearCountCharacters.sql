SELECT
    m.id,
    m.title,
    COUNT(ca.person_id) AS actors_count
FROM
    movie m
INNER JOIN
    character_ c ON m.id = c.movie_id
INNER JOIN
    character_actors ca ON c.id = ca.character_id
WHERE
    m.release_date >= NOW() - INTERVAL '5 years'
GROUP BY
    m.id,
    m.title
ORDER BY
    m.release_date DESC;

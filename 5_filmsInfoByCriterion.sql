SELECT 
    movie.id,
    movie.title,
    movie.release_date,
    movie.duration,
    movie.description,
    jsonb_build_object(
        'id', file_.id,
        'file_name', file_.file_name,
        'mime_type', file_.mime_type,
        'file_key', file_.file_key,
        'file_url', file_.file_url,
        'is_public', file_.is_public,
        'created_at', file_.created_at,
        'updated_at', file_.updated_at
    ) AS poster,
    jsonb_build_object(
        'id', director.id,
        'first_name', director.first_name,
        'last_name', director.last_name
    ) AS director,
    STRING_AGG(genres.name, ', ') AS genres
FROM movie
LEFT JOIN countries ON movie.country_id = countries.id
LEFT JOIN movie_genres ON movie.id = movie_genres.movie_id
LEFT JOIN genres ON movie_genres.genre_id = genres.id
LEFT JOIN person AS director ON movie.director_id = director.id
LEFT JOIN file_ ON movie.poster_id = file_.id
WHERE countries.id = 1 
    AND movie.release_date >= '2022-01-01'
    AND movie.duration > 135
    AND genres.name IN ('Action', 'Drama')
GROUP BY movie.id, file_.id, director.id;

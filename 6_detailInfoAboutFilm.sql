SELECT 
    movie.id,
    movie.title,
    movie.release_date,
    movie.duration,
    movie.description,
    jsonb_build_object(
        'id', poster_file.id,
        'file_name', poster_file.file_name,
        'mime_type', poster_file.mime_type,
        'file_key', poster_file.file_key,
        'file_url', poster_file.file_url,
        'is_public', poster_file.is_public,
        'created_at', poster_file.created_at,
        'updated_at', poster_file.updated_at
    ) AS poster,
    jsonb_build_object(
        'id', director.id,
        'first_name', director.first_name,
        'last_name', director.last_name,
        'photo', jsonb_build_object(
            'id', director_photo.id,
            'file_name', director_photo.file_name,
            'mime_type', director_photo.mime_type,
            'file_key', director_photo.file_key,
            'file_url', director_photo.file_url,
            'is_public', director_photo.is_public,
            'created_at', director_photo.created_at,
            'updated_at', director_photo.updated_at
        )
    ) AS director,
    jsonb_agg(
        jsonb_build_object(
            'id', actor.id,
            'first_name', actor.first_name,
            'last_name', actor.last_name,
            'photo', jsonb_build_object(
                'id', actor_photo.id,
                'file_name', actor_photo.file_name,
                'mime_type', actor_photo.mime_type,
                'file_key', actor_photo.file_key,
                'file_url', actor_photo.file_url,
                'is_public', actor_photo.is_public,
                'created_at', actor_photo.created_at,
                'updated_at', actor_photo.updated_at
            )
        )
    ) AS actors,
    jsonb_agg(
        jsonb_build_object(
            'id', genres.id,
            'name', genres.name
        )
    ) AS genres
FROM movie
LEFT JOIN file_ AS poster_file ON movie.poster_id = poster_file.id
LEFT JOIN person AS director ON movie.director_id = director.id
LEFT JOIN file_ AS director_photo ON director.main_photo_id = director_photo.id
LEFT JOIN character_actors ON character_actors.person_id = director.id
LEFT JOIN person AS actor ON character_actors.person_id = actor.id
LEFT JOIN file_ AS actor_photo ON actor.main_photo_id = actor_photo.id
LEFT JOIN movie_genres ON movie.id = movie_genres.movie_id
LEFT JOIN genres ON movie_genres.genre_id = genres.id
WHERE movie.id = 1
GROUP BY 
    movie.id, 
    poster_file.id, 
    director.id, 
    director_photo.id

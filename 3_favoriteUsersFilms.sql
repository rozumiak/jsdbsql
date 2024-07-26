SELECT username, ARRAY_AGG(favorite_movies.movie_id) AS favorite_movie_ids FROM user_
JOIN favorite_movies ON user_.id = favorite_movies.user_id
GROUP BY user_.username



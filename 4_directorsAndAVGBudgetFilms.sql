SELECT 
	person.first_name as director_name,
	person.last_name as director_lastname, 
	AVG(budget) as avg_budget 
	FROM movie
LEFT JOIN 
	person ON movie.director_id = person.id
GROUP BY 
	person.first_name, person.last_name
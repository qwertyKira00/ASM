INSERT _location(id, _location, country, latitude, longitude)
SELECT 1050,
(
	SELECT DISTINCT _location
	FROM _location
	WHERE country = 
	(
		SELECT MAX(country)
		FROM _location
	) AND _location LIKE 'Vinh%'
), 
(
	SELECT MAX(country)
	FROM _location
),
(
	SELECT AVG(latitude)
	FROM _location
),
(
	SELECT AVG(longitude)
	FROM _location
);

DELETE FROM _location
WHERE id IN
(
	SELECT id_location + 1 
	FROM _person
	WHERE _location.id = 1050 AND id_location = _location.id - 1 AND age > 0
)
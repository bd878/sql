SELECT departure_city, count(*) AS count
FROM routes
GROUP BY departure_city
HAVING count(*) >= 15;
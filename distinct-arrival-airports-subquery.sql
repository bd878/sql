SELECT DISTINCT a.city
FROM airports a
WHERE NOT EXISTS (
  SELECT 1 FROM routes r
    WHERE r.departure_city = 'Moscow'
    AND r.arrival_city = a.city
)
AND a.city <> 'Moscow'
ORDER BY a.city;

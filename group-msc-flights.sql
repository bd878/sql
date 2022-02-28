SELECT arrival_city, count(*)
  FROM routes
WHERE departure_city = 'Москва'
GROUP BY arrival_city
ORDER BY count DESC;

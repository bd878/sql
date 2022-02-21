SELECT
  departure_city,
  arrival_city,
  count(*)
FROM (
  SELECT
    departure_city,
    arrival_city,
    array_length(days_of_week, 1) AS days_per_week
  FROM routes
  WHERE departure_city = 'Москва'
) AS r
  WHERE days_per_week = 7
  GROUP BY 1, 2
  ORDER BY 3 DESC
  LIMIT 5;

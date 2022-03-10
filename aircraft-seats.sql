SELECT s.aircraft_code, a.model, count(*)
  FROM seats s
  JOIN aircrafts a
  ON s.aircraft_code = a.aircraft_code
GROUP BY s.aircraft_code, a.model
ORDER BY count DESC;
SELECT DISTINCT
  a.aircraft_code,
  a.model,
  s.fare_conditions,
  count(*) OVER (
    PARTITION BY a.aircraft_code, s.fare_conditions
  )
FROM seats s
JOIN aircrafts a
  ON a.aircraft_code = s.aircraft_code
ORDER BY 1;
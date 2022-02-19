SELECT
  f.status,
  f.aircraft_code,
  f.actual_arrival
  FROM flights f
  FULL OUTER JOIN aircrafts a
    ON f.aircraft_code = a.aircraft_code
  WHERE f.actual_departure IS NOT NULL
    AND f.actual_arrival IS NULL
    AND a.model LIKE 'Боинг %';
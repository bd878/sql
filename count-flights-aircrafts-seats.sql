SELECT
  f.flight_id,
  a.model,
  ( SELECT count(*)
    FROM seats s
      JOIN aircrafts a2
      ON s.aircraft_code = a2.aircraft_code
    WHERE f.aircraft_code = a2.aircraft_code
  ) AS sum_aircraft_seats
FROM flights f
  JOIN aircrafts a
  ON f.aircraft_code = a.aircraft_code;
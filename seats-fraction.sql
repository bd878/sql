SELECT
  f2.flight_id,
  f2.aircraft_code,
  f2.model,
  count(tf.ticket_no) AS sum_flight_seats,
  ( SELECT count(*)
    FROM seats s
      JOIN aircrafts a2
      ON s.aircraft_code = a2.aircraft_code
    WHERE f2.aircraft_code = a2.aircraft_code
  ) AS sum_aircraft_seats
FROM ticket_flights tf
  JOIN (
    SELECT
      f.flight_id,
      f.status,
      f.aircraft_code,
      a.model
    FROM flights f
      JOIN aircrafts a
      ON f.aircraft_code = a.aircraft_code
  ) f2
  ON f2.flight_id = tf.flight_id
WHERE f2.status = 'Arrived'
GROUP BY f2.flight_id, f2.aircraft_code, f2.model
ORDER BY f2.aircraft_code DESC;
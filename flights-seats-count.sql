SELECT
  f.flight_id,
  f.flight_no,
  f.departure_city,
  f.arrival_city,
  f.aircraft_code,
  tf.fare_conditions,
  count(tf.ticket_no) AS fact_passengers,
  ( SELECT count(s.seat_no)
      FROM seats s
      WHERE s.aircraft_code = f.aircraft_code
        AND s.fare_conditions = tf.fare_conditions
  ) AS total_seats
FROM flights_v f
  JOIN ticket_flights tf
  ON f.flight_id = tf.flight_id
WHERE f.status = 'Arrived'
GROUP BY 1, 2, 3, 4, 5, 6;
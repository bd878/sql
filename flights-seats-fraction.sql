WITH tickets_seats AS
  ( SELECT
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
    GROUP BY 1, 2, 3, 4, 5, 6
  )
SELECT
  ts.departure_city,
  ts.arrival_city,
  ts.fare_conditions,
  sum(ts.fact_passengers) AS sum_fact_passengers,
  sum(ts.total_seats) AS sum_total_seats,
  round( sum(ts.fact_passengers)::numeric /
         sum(ts.total_seats)::numeric, 2 ) AS fraction
FROM tickets_seats ts
GROUP BY ts.departure_city, ts.arrival_city, ts.fare_conditions
ORDER BY ts.departure_city;
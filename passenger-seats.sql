WITH passenger_seats AS (
  SELECT
    s.seat_no,
    substr( b.passenger_name,
      strpos( b.passenger_name, ' ' ) + 1
    ) AS lastname,
    left( b.passenger_name,
      strpos( b.passenger_name, ' ' ) - 1
    ) AS firstname,
    b.email
  FROM seats s
    LEFT OUTER JOIN (
      SELECT
        tf.fare_conditions,
        t.passenger_name,
        bp.seat_no,
        t.contact_data->'email' AS email
      FROM (
        ticket_flights tf
        JOIN tickets t
          ON t.ticket_no = tf.ticket_no
      )
        JOIN boarding_passes bp
          ON bp.flight_id = tf.flight_id
          AND tf.ticket_no = bp.ticket_no
      WHERE bp.flight_id = 27584
    ) b
    ON s.seat_no = b.seat_no
  WHERE s.aircraft_code = 'SU9'
)
SELECT
  seat_no,
  firstname,
  lastname,
  email
FROM passenger_seats
ORDER BY left( seat_no, length( seat_no ) - 1 )::integer,
  right( seat_no, 1);

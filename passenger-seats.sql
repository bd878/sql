SELECT
  s.seat_no,
  substr( b.passenger_name,
    strpos( b.passenger_name, ' ' ) + 1
  ) AS lastname,
  left( b.passenger_name,
    strpos( b.passenger_name, ' ' ) - 1
  ) AS firstname
FROM seats s
  LEFT OUTER JOIN (
    SELECT
      tf.fare_conditions,
      t.passenger_name,
      bp.seat_no
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

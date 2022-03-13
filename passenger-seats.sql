SELECT tf.fare_conditions, bp.seat_no, t.passenger_name
  FROM (
    ticket_flights tf
    JOIN tickets t
      ON t.ticket_no = tf.ticket_no
  )
  JOIN boarding_passes bp
    ON bp.flight_id = tf.flight_id
    AND tf.ticket_no = bp.ticket_no
WHERE bp.flight_id = 27584
ORDER BY t.passenger_name DESC;
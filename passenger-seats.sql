SELECT bp.seat_no, t.passenger_name
FROM boarding_passes bp
  JOIN tickets t
  ON bp.ticket_no = t.ticket_no
WHERE bp.flight_id = 27584
ORDER BY t.passenger_name DESC;
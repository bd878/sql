SELECT
  t.passenger_name,
  b.book_date
FROM flights f
  JOIN boarding_passes bp
    ON f.flight_id = bp.flight_id
  JOIN tickets t
    ON t.ticket_no = bp.ticket_no
  JOIN bookings b
    ON b.book_ref = t.book_ref
WHERE f.scheduled_departure::date = bookings.now()::date - INTERVAL '2 day'
AND f.departure_airport = 'SVO'
AND f.arrival_airport = 'OVB'
AND bp.seat_no = '1A';

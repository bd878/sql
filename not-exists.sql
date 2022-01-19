SELECT count(*) FROM flights f
  JOIN seats s
  ON f.aircraft_code = s.aircraft_code
WHERE f.flight_no = 'PG0404'
AND f.scheduled_departure::date = bookings.now()::date - INTERVAL '1 day'
AND NOT EXISTS (
  SELECT NULL
  FROM boarding_passes bp
  WHERE f.flight_id = bp.flight_id
  AND s.seat_no = bp.seat_no
);

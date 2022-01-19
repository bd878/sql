SELECT count(*)
FROM (
  SELECT s.seat_no
  FROM seats s
  WHERE s.aircraft_code = (
    SELECT f.aircraft_code
    FROM flights f
    WHERE f.flight_no = 'PG0404'
    AND f.scheduled_departure::date = bookings.now()::date - INTERVAL '1 day'
  )
  EXCEPT
  SELECT bp.seat_no
  FROM boarding_passes bp
  WHERE bp.flight_id = (
    SELECT f.flight_id
    FROM flights f
    WHERE f.flight_no = 'PG0404'
    AND f.scheduled_departure::date = bookings.now()::date - INTERVAL '1 day'
  )
) t;
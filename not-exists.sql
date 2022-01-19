SELECT * FROM flights f
WHERE f.flight_no = 'PG0404'
AND f.scheduled_departure::date = bookings.now()::date - INTERVAL '1 day';

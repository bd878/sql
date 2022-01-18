SELECT f.flight_no FROM flights f
WHERE f.scheduled_departure::date = bookings.now()::date - INTERVAL '2 day'
LIMIT 5;

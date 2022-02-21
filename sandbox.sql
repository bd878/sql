SELECT
  f1.flight_no,
  f1.departure_airport,
  f1.arrival_airport,
  f1.aircraft_code,
  f1.duration,
  f1.days_of_week
FROM (
  SELECT
    f.flight_no,
    f.departure_airport,
    f.arrival_airport,
    f.aircraft_code,
  ( f.scheduled_arrival -
    f.scheduled_departure
  ) AS duration,
  ( to_char( f.scheduled_departure,
    'ID'::text ))::integer AS days_of_week
  FROM flights f
) f1
GROUP BY f1.flight_no, f1.departure_airport,
         f1.arrival_airport, f1.aircraft_code,
         f1.duration, f1.days_of_week
ORDER BY f1.flight_no, f1.departure_airport,
         f1.arrival_airport, f1.aircraft_code,
         f1.duration, f1.days_of_week;

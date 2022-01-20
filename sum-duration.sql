SELECT
  f.flight_no,
  f.scheduled_duration,
  min(f.actual_duration),
  max(f.actual_duration),
  sum(CASE
        WHEN f.actual_departure - f.scheduled_departure > INTERVAL '1 hour'
        THEN 1 ELSE 0
      END) delays
FROM flights_v f
WHERE f.departure_city = 'Moscow'
AND f.arrival_city = 'St. Petersburg'
AND f.status = 'Arrived'
GROUP BY f.flight_no, f.scheduled_duration;
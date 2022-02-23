SELECT
  a.model,
  sum(f.actual_arrival - f.actual_departure) OVER (
    PARTITION BY date_trunc('month', f.actual_departure)
    ORDER BY f.actual_departure
  ) AS flight_hours
FROM
  flights f
  JOIN aircrafts a
    ON f.aircraft_code = a.aircraft_code
  WHERE f.actual_arrival IS NOT NULL
    AND f.actual_departure IS NOT NULL
  ORDER BY 1;
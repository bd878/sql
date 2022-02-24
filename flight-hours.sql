SELECT
  f.day,
  sum(f.day_duration) OVER (
    PARTITION BY date_trunc('month', f.day_duration)
    ORDER BY f.day_duration
  ) AS flight_hours
FROM
  ( SELECT
      date_trunc('day', f.actual_arrival) AS day,
      sum(f.actual_arrival - f.actual_departure) OVER (
        PARTITION BY date_trunc('day', f.actual_arrival)
      ) AS day_duration
    FROM
      flights
    WHERE actual_arrival IS NOT NULL
      AND actual_departure IS NOT NULL
      AND aircraft_code = 'SU9'
  ) f
  ORDER BY 1;
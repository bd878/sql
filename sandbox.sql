SELECT
  r1.aircraft_code,
  count(r1.aircraft_code) AS aircraft_count,
  ( SELECT count(r2.flight_no)
    FROM routes r2
  ) AS total_count
FROM routes r1
GROUP BY r1.aircraft_code;
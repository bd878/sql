SELECT
  a.aircraft_code,
  a.model,
  r.aircraft_count,
  round( r.aircraft_count::numeric /
         r.total_count::numeric, 3 ) AS fraction
FROM aircrafts a
LEFT OUTER JOIN (
  SELECT
    r1.aircraft_code,
    count(r1.aircraft_code) AS aircraft_count,
    ( SELECT count(r2.flight_no)
      FROM routes r2
    ) AS total_count
  FROM routes r1
  GROUP BY r1.aircraft_code
) r
ON r.aircraft_code = a.aircraft_code
ORDER BY r.aircraft_count ASC;
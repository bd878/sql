SELECT
  r.aircraft_code AS a_code,
  a.model,
  r.aircraft_code AS r_code,
  count(r.aircraft_code) AS num_routes,
  count(r.aircraft_code) / () AS fraction
FROM aircrafts a
LEFT OUTER JOIN routes r
  ON r.aircraft_code = a.aircraft_code
GROUP BY 1, 2, 3
ORDER BY 4 DESC;
SELECT
  s2.model,
  string_agg(
    s2.fare_conditions || ' (' || s2.num || ')', ', '
  )
FROM (
  SELECT
    a.model,
    s.fare_conditions,
    count(*) as num
  FROM seats AS s
  JOIN aircrafts a ON a.aircraft_code = s.aircraft_code
  GROUP BY 1, 2
  ORDER BY 1, 2
) AS s2
GROUP BY s2.model
ORDER BY s2.model;

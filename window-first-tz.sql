SELECT
  airport_name,
  city,
  timezone,
  round(coordinates[1]::numeric, 4) AS latitude,
  first_value(coordinates[1]) OVER tz AS first_in_timezone,
  coordinates[1] - first_value(coordinates[1]) OVER tz AS delta,
  rank() OVER tz
FROM airports
WHERE timezone IN ('Asia/Irkutsk', 'Asia/Krasnoyarsk')
WINDOW tz AS (PARTITION BY timezone ORDER BY coordinates[1] DESC)
ORDER BY timezone, rank;

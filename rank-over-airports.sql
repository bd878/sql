SELECT
  airport_name, city,
  round( coordinates[1]::numeric, 2 ) AS ltd,
  timezone,
  rank() OVER (
    PARTITION BY timezone
    ORDER BY coordinates[1]::numeric DESC
  )
FROM airports
WHERE timezone IN ( 'Asia/Irkutsk', 'Asia/Krasnoyarsk' )
ORDER BY timezone, rank;
SELECT city, airport_name, coordinates[0] 
FROM airports
WHERE coordinates[0]::numeric IN (
  (SELECT min(coordinates[0]::numeric) FROM airports),
  (SELECT max(coordinates[0]::numeric) FROM airports)
)
ORDER BY coordinates[0]::numeric;
SELECT airport_name, city, coordinates[0] FROM airports
WHERE coordinates[0] IN (
  (SELECT max( coordinates[0] ) FROM airports),
  (SELECT min( coordinates[0] ) FROM airports)
)
ORDER BY coordinates[0];

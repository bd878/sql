SELECT departure_city, count(*)
  FROM routes
  GROUP BY departure_city
  HAVING departure_city = ANY (
    SELECT city FROM airports
      WHERE coordinates[0] > 150
  )
  ORDER BY count DESC;
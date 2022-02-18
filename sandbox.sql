SELECT c1.departure, c1.arrival
  FROM cities c1
  WHERE NOT EXISTS (
    SELECT 1
      FROM cities c2
      WHERE c2.departure = c1.arrival
        AND c2.arrival = c1.departure
  );

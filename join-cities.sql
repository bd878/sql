SELECT c1.departure, c2.arrival
FROM cities c1
JOIN cities c2
  ON c1.departure < c2.departure;
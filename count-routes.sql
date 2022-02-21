SELECT departure_city, count(distinct arrival_city)
  FROM routes
  GROUP BY departure_city
  ORDER BY count DESC;

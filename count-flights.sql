SELECT departure_city, arrival_city, count(*)
  FROM routes
  WHERE departure_city = 'Москва'
    AND arrival_city = 'Санкт-Петербург'
  GROUP BY 1, 2;

SELECT DISTINCT departure_city, arrival_city
  FROM routes r
  JOIN aircrafts a ON r.aircraft_code = a.aircraft_code
  WHERE a.model LIKE '% 777-300'
  ORDER BY 1;

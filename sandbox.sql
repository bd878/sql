SELECT flight_no, unnest( days_of_week ) AS day_of_week
  FROM routes
  WHERE departure_city = 'Москва'
  ORDER BY flight_no;

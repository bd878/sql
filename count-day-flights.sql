SELECT dw.name_of_day, count(*) AS num_flights
  FROM (
      SELECT unnest( days_of_week ) AS num_of_day
        FROM routes
        WHERE departure_city = 'Москва'
    ) AS r,
    unnest( '{ 1, 2, 3, 4, 5, 6, 7 }'::integer[],
      '{ "Пн.", "Вт.", "Ср.", "Чт.", "Пт.", "Сб.", "Вс."}'::text[]
    ) AS dw( num_of_day, name_of_day )
  WHERE r.num_of_day = dw.num_of_day
  GROUP BY r.num_of_day, dw.name_of_day
  ORDER BY r.num_of_day;
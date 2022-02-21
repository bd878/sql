SELECT * FROM unnest( '{ 1, 2, 3, 4, 5, 6, 7 }'::integer[],
  '{ "Пн.", "Вт.", "Ср.", "Чт.", "Пт.", "Сб.", "Вс."}'::text[]
) AS dw( num_of_day, name_of_day );
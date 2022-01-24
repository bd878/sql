SELECT aa.city, aa.airport_code, aa.airport_name
FROM (
  SELECT city, count(*)
    FROM airports
    GROUP BY city
    HAVING count(*) > 1
) AS a
JOIN airports AS aa ON aa.city = a.city
ORDER BY aa.city, aa.airport_name;

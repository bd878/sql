SELECT
  array_length( days_of_week, 1 ) AS weekdays,
  count(*)
FROM
  routes
GROUP BY 1
ORDER BY 2 DESC;
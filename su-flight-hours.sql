SELECT
  date_trunc('day', actual_arrival) AS day,
  sum(actual_arrival - actual_departure)
FROM
  flights
WHERE aircraft_code = 'SU9'
  AND actual_departure IS NOT NULL
  AND actual_arrival IS NOT NULL
  AND actual_departure::date < '2017-08-01'::date
GROUP BY 1;
SELECT
  count(*)
FROM
  flights
WHERE aircraft_code = 'SU9'
  AND actual_departure IS NOT NULL
  AND actual_arrival IS NOT NULL
  AND actual_departure::date = '2017-07-16'::date;
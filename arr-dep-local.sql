SELECT
  dep.city,
  arr.city,
  f.actual_departure,
  f.actual_arrival,
  timezone( dep.timezone, f.actual_departure ) AS actual_departure_local,
  timezone( arr.timezone, f.actual_arrival ) AS actual_arrival_local,
  dep.timezone AS departure_timezone,
  arr.timezone AS arrival_timezone
FROM
  flights f
  JOIN airports arr
    ON f.arrival_airport = arr.airport_code
  JOIN airports dep
    ON f.departure_airport = dep.airport_code
  WHERE f.actual_departure IS NOT NULL
    AND f.actual_arrival IS NOT NULL
    AND dep.timezone <> arr.timezone;

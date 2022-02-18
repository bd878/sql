SELECT
  r.*,
  a.model as aircraft_name
FROM routes r JOIN aircrafts a
ON r.aircraft_code = a.aircraft_code
WHERE a.model LIKE 'Боинг %'
  AND departure_airport IN {'AER','NOZ'}
  AND arrival_airport IN {'NOZ','AER'}
ORDER BY aircraft_name;

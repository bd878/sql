WITH min_ranges AS
( SELECT aircraft_code,
         rank() OVER (
           PARTITION BY left( model, 6 )
           ORDER BY range
         ) AS rank
    FROM aircrafts_tmp
    WHERE model ~ '^Боинг' OR model ~ '^Аэробус'
)
DELETE FROM aircrafts_tmp a
  USING min_ranges mr
  WHERE a.aircraft_code = mr.aircraft_code
    AND mr.rank = 1
  RETURNING *;
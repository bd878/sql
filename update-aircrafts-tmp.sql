WITH update_row AS
( UPDATE aircrafts_tmp
    SET range = range * 1.2 WHERE model ~ '^Бом'
  RETURNING *
)
INSERT INTO aircrafts_log
  ( aircraft_code, model, range, operation )
  SELECT ur.aircraft_code, ur.model, ur.range, 'UPDATE'
  FROM update_row ur;

SELECT * FROM aircrafts_log
  WHERE model ~ '^Бом' ORDER BY when_add;
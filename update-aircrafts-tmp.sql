WITH update_row AS
( UPDATE aircrafts_tmp
    SET range = range * 1.2 WHERE model ~ '^Бом'
  RETURNING *
)
INSERT INTO aircrafts_log
  SELECT ur.aircraft_code, ur.model, ur.range,
    CURRENT_TIMESTAMP, 'UPDATE'
  FROM update_row ur;

SELECT * FROM aircrafts_log
  WHERE model ~ '^Бом' ORDER BY when_add;
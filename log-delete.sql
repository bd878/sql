WITH delete_row AS
( DELETE FROM aircrafts_tmp
    WHERE model ~ '^Бом'
    RETURNING *
)
INSERT INTO aircrafts_log
  ( aircraft_code, model, range, operation )
  SELECT dr.aircraft_code, dr.model, dr.range, 'DELETE'
  FROM delete_row dr;
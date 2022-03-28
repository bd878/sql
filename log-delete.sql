WITH delete_row AS
( DELETE FROM aircrafts_tmp
    WHERE model ~ '^Бом'
    RETURNING *
)
INSERT INTO aircrafts_log
  SELECT dr.aircraft_code, dr.model, dr.range,
    CURRENT_TIMESTAMP, 'DELETE'
  FROM delete_row dr;
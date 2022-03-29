WITH add_row AS
( INSERT INTO aircrafts_tmp
  SELECT * FROM aircrafts
  RETURNING *
) INSERT INTO aircrafts_log
    ( aircraft_code, model, range, operation )
    SELECT
      ar.aircraft_code,
      ar.model,
      ar.range,
      'INSERT'
    FROM add_row ar;

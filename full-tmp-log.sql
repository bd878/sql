WITH add_row AS
( INSERT INTO aircrafts_tmp
  SELECT * FROM aircrafts
  RETURNING *
) INSERT INTO aircrafts_log
    SELECT
      ar.aircraft_code,
      ar.model,
      ar.range,
      CURRENT_TIMESTAMP,
      'INSERT'
    FROM add_row ar;

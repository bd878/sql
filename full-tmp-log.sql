WITH add_row AS
( INSERT INTO aircrafts_tmp
  SELECT * FROM aircrafts
  RETURNING aircraft_code, model, range, 'INSERT'
) INSERT INTO aircrafts_log
    ( aircraft_code, model, range, operation )
    SELECT * FROM add_row;

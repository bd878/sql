WITH add_row AS
( INSERT INTO aircrafts_tmp
  VALUES ( 'SU9', 'Sukhoi SuperJet-100', 3000 )
  ON CONFLICT DO NOTHING
  RETURNING *
) INSERT INTO aircrafts_log
    ( aircraft_code, model, range, operation )
    SELECT
      add_row.aircraft_code,
      add_row.model,
      add_row.range,
      'INSERT'
    FROM add_row;
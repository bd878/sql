INSERT INTO aircrafts_tmp
  VALUES ( 'SU9', 'Sukhoi SuperJet-100', 3000 )
  ON CONFLICT ( aircraft_code ) DO NOTHING
  RETURNING *;

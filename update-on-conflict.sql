INSERT INTO aircrafts_tmp
  VALUES ( 'SU9', 'Sukhoi SuperJet-100', 3000 )
  ON CONFLICT ON CONSTRAINT aircrafts_tmp_pkey
  DO UPDATE SET model = excluded.model,
                range = excluded.range
  RETURNING *;
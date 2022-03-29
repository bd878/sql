INSERT INTO seats_tmp
  ( aircraft_code, seat_no, fare_conditions )
  VALUES ( 773, '1A', 'Comfort' )
  ON CONFLICT ON CONSTRAINT seats_tmp_pkey
    DO UPDATE SET aircraft_code = excluded.aircraft_code,
                  seat_no = excluded.seat_no
  RETURNING *;

INSERT INTO seats_tmp
  ( aircraft_code, seat_no, fare_conditions )
  VALUES ( 763, '11A', 'Business' )
  ON CONFLICT ( aircraft_code, seat_no ) DO NOTHING;


ALTER TABLE aircrafts ADD COLUMN specifications jsonb;

UPDATE aircrafts
  SET specifications = 
    '{ "crew": 2,
       "engines": {"type": "IAE V2500", "num": 2 }
    }'::jsonb
  WHERE aircraft_code = 'SU9';

SELECT model, specifications #> '{ engines, type }'
  FROM aircrafts
  WHERE aircraft_code = 'SU9';

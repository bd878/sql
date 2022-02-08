DROP TABLE IF EXISTS aircrafts;

CREATE TABLE aircrafts (
  aircraft_code char(3) NOT NULL,
  model text NOT NULL,
  range integer NOT NULL,
  CHECK ( range > 0 ),
  PRIMARY KEY ( aircraft_code )
);

INSERT INTO aircrafts VALUES 
  ('SU9', 'Sukhoi SuperJet-100', 3500);

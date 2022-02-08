DROP TABLE IF EXISTS airports CASCADE;

CREATE TABLE airports
( airport_code char(3) NOT NULL,
  airport_name text NOT NULL,
  city text NOT NULL,
  longitude float NOT NULL,
  latitude float NOT NULL,
  timezone text NOT NULL,
  PRIMARY KEY (airport_code)
);

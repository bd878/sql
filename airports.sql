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

INSERT INTO airports VALUES
  ( 'LED',
    'Pulkovo Airport',
    'St. Petersburg',
    30.262500762939453,
    59.80030059814453,
    'Europe/Moscow'
  ),
  ( 'SVO',
    'Sheremetyevo International Airport',
    'Moscow',
    37.4146,
    55.972599,
    'Europe/Moscow'
  ),
  ( 'VKO',
    'Vnukovo International Airport',
    'Moscow',
    37.2615013123,
    55.5914993286,
    'Europe/Moscow'
  );

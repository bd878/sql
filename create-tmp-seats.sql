CREATE TEMP TABLE seats_tmp AS
  SELECT * FROM seats WITH NO DATA;

ALTER TABLE seats_tmp
  ADD PRIMARY KEY ( aircraft_code, seat_no );

ALTER TABLE seats_tmp
  ADD CHECK (fare_conditions IN
      ( 'Economy', 'Comfort', 'Business' ));

INSERT INTO seats_tmp SELECT * FROM seats;

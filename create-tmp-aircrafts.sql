CREATE TEMP TABLE aircrafts_tmp AS
  SELECT * FROM aircrafts WITH NO DATA;

ALTER TABLE aircrafts_tmp
  ADD PRIMARY KEY ( aircraft_code );

ALTER TABLE aircrafts_tmp
  ADD UNIQUE ( model );
CREATE TEMP TABLE aircrafts_log AS
  SELECT * FROM aircrafts WITH NO DATA;

ALTER TABLE aircrafts_log
  ADD COLUMN when_add timestamp;

ALTER TABLE aircrafts_log
  ADD COLUMN operation text;

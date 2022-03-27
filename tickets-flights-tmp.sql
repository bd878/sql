CREATE TEMP TABLE ticket_flights_tmp AS
  SELECT * FROM ticket_flights WITH NO DATA;

ALTER TABLE ticket_flights_tmp
  ADD PRIMARY KEY ( ticket_no, flight_id );
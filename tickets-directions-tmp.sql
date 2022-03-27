CREATE TEMP TABLE tickets_directions AS
  SELECT DISTINCT departure_city, arrival_city
    FROM routes;

ALTER TABLE tickets_directions
  ADD COLUMN last_ticket_time timestamp;

ALTER TABLE tickets_directions
  ADD COLUMN tickets_num integer DEFAULT 0;

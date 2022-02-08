ALTER TABLE flights DROP CONSTRAINT IF EXISTS flights_check1; -- actual_arrival IS NULL OR (...)

ALTER TABLE flights
  ADD CHECK (actual_arrival IS NULL OR
    ( actual_departure IS NOT NULL AND
      actual_arrival > actual_departure
    )
  );

INSERT INTO flights (flight_no, scheduled_departure, scheduled_arrival, departure_airport,
  arrival_airport, status, aircraft_code, actual_departure)
VALUES 
  ( 123456,
    current_timestamp,
    current_timestamp + INTERVAL '1 day 6 min',
    'LED',
    'SVO',
    'Scheduled',
    'SU9',
    current_timestamp
  ),
  ( 123457,
    current_timestamp,
    current_timestamp + INTERVAL '1 day 3 hours',
    'LED',
    'DME',
    'Scheduled',
    'SU9',
    current_timestamp
  );
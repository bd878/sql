DROP TABLE IF EXISTS flights;

CREATE TABLE flights
( flight_id serial NOT NULL,
  flight_no char(6) NOT NULL,
  scheduled_departure timestamptz NOT NULL,
  scheduled_arrival timestamptz NOT NULL,
  departure_airport char(3) NOT NULL,
  arrival_airport char(3) NOT NULL,
  status varchar(20) NOT NULL,
  aircraft_code char(3) NOT NULL,
  actual_departure timestamptz,
  actual_arrival timestamptz,
  CHECK (scheduled_arrival > scheduled_departure),
  CHECK (actual_arrival IS NULL OR
    ( actual_departure IS NOT NULL AND
      actual_arrival IS NOT NULL AND
      actual_arrival > actual_departure
    )
  ),
  CHECK (status IN ('On Time', 'Delayed', 'Departed',
                    'Arrived', 'Scheduled', 'Cancelled')
  ),
  PRIMARY KEY (flight_id),
  UNIQUE (flight_no, scheduled_departure),
  FOREIGN KEY (aircraft_code)
    REFERENCES aircrafts (aircraft_code),
  FOREIGN KEY (arrival_airport)
    REFERENCES airports (airport_code),
  FOREIGN KEY (departure_airport)
    REFERENCES airports (airport_code)
);
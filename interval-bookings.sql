SELECT flight_no, flight_id, departure_city, arrival_city,
  scheduled_departure
  FROM flights_v
  WHERE scheduled_departure
    BETWEEN bookings.now() AND bookings.now() + INTERVAL '15 days'
    AND ( ( departure_city, arrival_city ) ) IN (
      ( 'Красноярск', 'Москва' ), ( 'Москва', 'Сочи' ),
      ( 'Сочи', 'Москва' ), ( 'Сочи', 'Красноярск' )
    )
  ORDER BY departure_city, arrival_city, scheduled_departure;

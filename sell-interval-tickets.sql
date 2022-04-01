WITH sell_ticket AS
( INSERT INTO ticket_flights_tmp
    ( ticket_no, flight_id, fare_conditions, amount )
    VALUES ( '1234567890123', 13829, 'Economy', 10500 ),
           ( '1234567890123', 4728, 'Economy', 3400 ),
           ( '1234567890123', 30523, 'Economy', 3400 ),
           ( '1234567890123', 7757, 'Economy', 3400 ),
           ( '1234567890123', 30829, 'Economy', 12800 )
    RETURNING *
)
UPDATE tickets_directions td
  SET last_ticket_time = CURRENT_TIMESTAMP,
      tickets_num = tickets_num + (
        SELECT count(*)
        FROM sell_ticket st, flights_v fv
          WHERE st.flight_id = fv.flight_id
            AND td.departure_city = fv.departure_city
            AND td.arrival_city = fv.arrival_city
      )
  WHERE ( td.departure_city, td.arrival_city ) IN (
    SELECT departure_city, arrival_city
      FROM flights_v fv
      WHERE fv.flight_id IN (
        SELECT flight_id FROM sell_ticket
      )
  );
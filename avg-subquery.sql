SELECT count(*) FROM bookings
WHERE total_amount > (
  SELECT avg(total_amount) FROM bookings
);
SELECT
  b.book_ref,
  b.book_date,
  extract( 'month' from b.book_date ) AS month,
  extract( 'day' from b.book_date ) AS day,
  count(*) OVER (
    PARTITION BY date_trunc( 'month', b.book_date )
    ORDER BY b.book_date
  ) AS count
FROM ticket_flights tf
JOIN tickets t ON tf.ticket_no = t.ticket_no
JOIN bookings b ON t.book_ref = b.book_ref
WHERE tf.flight_id = 1
ORDER BY b.book_ref;

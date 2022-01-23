SELECT
  b.book_ref,
  count(*) tickets_count
FROM bookings b
JOIN tickets t ON b.book_ref = t.book_ref
GROUP BY b.book_ref
HAVING count(*) > 1;

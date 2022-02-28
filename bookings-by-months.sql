SELECT
  date_trunc( 'month', b.book_date ) AS month,
  sum( b.total_amount ) OVER (
    PARTITION BY date_trunc( 'month', b.book_date )
    ORDER BY b.book_date
  ) AS amount
FROM
  bookings b
WHERE '2017-01-01'::date < b.book_date
  AND b.book_date < '2018-01-01'::date
ORDER BY 1;
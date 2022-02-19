WITH RECURSIVE ranges (min_sum, max_sum) AS
  ( VALUES ( 0, 100000 )
    UNION ALL
    SELECT min_sum + 100000, max_sum + 100000
      FROM ranges
      WHERE max_sum <
        ( SELECT max( total_amount ) FROM bookings )
  )
SELECT r.min_sum, r.max_sum, count( b.* )
  FROM bookings b
  RIGHT OUTER JOIN ranges r
    ON b.total_amount >= r.min_sum
    AND b.total_amount < r.max_sum
  GROUP BY r.min_sum, r.max_sum
  ORDER BY r.min_sum;

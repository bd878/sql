SELECT r.min_sum, r.max_sum, count(b.*)
  FROM bookings b
  RIGHT OUTER JOIN
    ( VALUES (0, 100000), (100000, 200000),
             (200000, 300000), (300000, 400000)
    ) AS r ( min_sum, max_sum )
      ON b.total_amount >= r.min_sum
      AND b.total_amount < r.max_sum
  GROUP BY r.min_sum, r.max_sum;
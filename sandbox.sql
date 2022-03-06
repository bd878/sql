WITH RECURSIVE ranges( n, min_sum, max_sum ) AS (
  VALUES ( 1, 0, 100000 ),
         ( 1, 100000, 200000 ),
         ( 1, 200000, 300000 )
  UNION
  SELECT n + 1, min_sum + 100000, max_sum + 100000
    FROM ranges
    WHERE max_sum < 
      ( SELECT max(total_amount) FROM bookings )
    AND n < 100
)
SELECT * FROM ranges
LIMIT 100;
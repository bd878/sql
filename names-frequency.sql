SELECT right( passenger_name, length( passenger_name ) - strpos( passenger_name, ' ' ))
  AS lastname, count(*)
  FROM tickets
  GROUP BY 1
  ORDER BY 2 DESC;

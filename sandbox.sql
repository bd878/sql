WITH ds AS
  ( SELECT DISTINCT city FROM airports )
SELECT count(*)
  FROM ds AS ds1
  JOIN ds AS ds2
  ON ds1.city <> ds2.city;
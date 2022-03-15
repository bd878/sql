WITH aircrafts_rank AS
  ( SELECT
      model,
      range,
      rank() OVER (
        PARTITION BY left( model, 6 )
        ORDER BY range
      ) AS rank
    FROM aircrafts
  )
SELECT model, rank, range
FROM aircrafts_rank
ORDER BY rank;
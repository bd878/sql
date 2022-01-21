SELECT tt.cnt, count(*)
FROM (
  SELECT t.book_ref, count(*) cnt
  FROM tickets t
  GROUP BY t.book_ref
) tt
GROUP BY tt.cnt;

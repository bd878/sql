SELECT city, count(*)
FROM airports
GROUP BY city
HAVING count(*) > 1
ORDER BY 2 DESC;
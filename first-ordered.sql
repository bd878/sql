SELECT t.passenger_name, t.ticket_no
FROM tickets t
JOIN boarding_passes bp ON t.ticket_no = bp.ticket_no
GROUP BY t.passenger_name, t.ticket_no
HAVING max(bp.boarding_no) = 1
AND count(*) > 1;
